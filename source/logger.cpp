#include "logger.h"
#include<time.h>
#include<cstring>
#include<cerrno>
#include<cstdio>
#include<stdarg.h>
#include<stdexcept>
#include<iostream>


using namespace jjm::utility;

Logger* Logger::m_instance = nullptr;

const char* Logger::s_level[LEVEL_COUNT] ={
    "DEBUG",
    "INFO",
    "WARN",
    "ERROR",
    "FATAL"
};


Logger::Logger():m_level(Logger::DEBUG),cur_size(0),max_size(0)
{
    /*    open(m_filename);  
    *不能在这个构造函数里面打开文件！ 因为在实例化的时候，会调用构造函数，紧接着调用open(),然而open没有输入参数，打开失败！
    */ 
}

Logger::~Logger()
{
   close();
   delete m_instance;
}

void Logger::level(Logger::Level Level)
{
    m_level = Level;
}

void Logger::max(size_t max)
{
    max_size = max;
}

void Logger::rotate()
{
    close();
    time_t ticks = time(NULL);
    struct tm* ptm = localtime(&ticks);
    char timestamp[32];
    memset(timestamp,0,sizeof(timestamp));
    /*
    *windows 下重命名要特别注意， 不能有下列符号：
    *                                       / \ 、 ： - * 等等
    */
    strftime(timestamp,sizeof(timestamp),"(%Y.%m.%d_%Hh.%Mm.%Ss)",ptm);   

    std::string filename = m_filename + timestamp;

    if(rename(m_filename.c_str(),filename.c_str())!=0 )   
    {
        throw std::logic_error("rename log file failed: " + std::string(strerror(errno)) );
    }

    open(m_filename);
}

Logger* Logger::get_instance()
{
    if(Logger::m_instance == nullptr)
    {
        /*必须得对m_instance赋值，不能直接 return new Logger()*/
        m_instance =  new Logger();  
    }
    return m_instance;
}

void Logger::open(const std::string& filename)
{
    m_filename = filename;
    m_fout.open(filename,std::ios::app);
    if(m_fout.fail())
    {
        throw std::logic_error("open file failed "+ filename);
    }

    m_fout.seekp(0,std::ios::end);
    cur_size = m_fout.tellp();
}

void Logger::close()
{
    m_fout.close();
}

void Logger::log(Level level,const char* file,int line,const char* format,...)
{
    /*日志等级低， 直接返回*/ 
    if( level < m_level )    return ;   

    if(m_fout.fail())
    {
        throw std::logic_error("open file failed " + m_filename);
    }
    
    /*获取当前时间*/
    time_t   ticks = time(NULL);
    struct tm* ptm = localtime(&ticks);
    char timestamp[32];
    memset(timestamp,0,sizeof(timestamp));                            
    strftime(timestamp,sizeof(timestamp),"%Y-%m-%d %H:%M:%S",ptm);    

    /*先创建好 时间 日志等级 文件名 行号 字符串buffer写入日志文件*/
    const char * fmt = "%s %s %s:%d message: ";
    int size = snprintf(NULL,0,fmt,timestamp,s_level[level],file,line);
    if(size>0)
    {
        char *buffer = new char[size+1];
        memset(buffer,0,size+1);     
        snprintf(buffer,size+1,fmt,timestamp,s_level[level],file,line);
        buffer[size] = '\0';
        m_fout << buffer;
        cur_size += size;
        delete[] buffer;
    }

    /*再写入带可变参数字符串 buffer写入日志文件*/
    va_list ptr_arg;
    va_start(ptr_arg,format);
    size = vsnprintf(nullptr,0,format,ptr_arg);
    va_end(ptr_arg);
    if(size>0)
    {
        char* buffer = new char[size+1];
        memset(buffer,0,size+1);

        va_start(ptr_arg,format);
        vsnprintf(buffer,size+1,format,ptr_arg);
        va_end(ptr_arg);
        
        m_fout<<buffer<<'\n';
        cur_size += size;

        delete [] buffer;
    }
    m_fout.flush();

    /*写入后判断日志文件大小是否已经达到最大值*/
    if(cur_size > max_size && max_size>0)
    {
        rotate();
    }
}