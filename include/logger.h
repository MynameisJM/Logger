#ifndef __LOGGER_H__
#define __LOGGER_H__
#include<string>
#include<fstream>

#define DEBUG(format,...) \
    Logger::get_instance()->log(Logger::DEBUG,__FILE__,__LINE__,format, ##__VA_ARGS__);

#define INFO(format,...) \
    Logger::get_instance()->log(Logger::INFO,__FILE__,__LINE__,format, ##__VA_ARGS__);

#define WARN(format,...) \
    Logger::get_instance()->log(Logger::WARN,__FILE__,__LINE__,format, ##__VA_ARGS__);

#define ERROR(format,...) \
    Logger::get_instance()->log(Logger::ERROR,__FILE__,__LINE__,format, ##__VA_ARGS__);

#define FATAL(format,...) \
    Logger::get_instance()->log(Logger::FATAL,__FILE__,__LINE__,format, ##__VA_ARGS__);

#define LEVEL(l) (Logger::get_instance()->level((l)));   // 要带括号！ 并且要避开同名形参啊， LEVEL(level) 跟level()冲突了！

#define MAX(m) (Logger::get_instance()->max((m)));
    
namespace jjm{

namespace utility{

class Logger
{
public:
    enum Level{
        DEBUG = 0,
        INFO,
        WARN,
        ERROR,
        FATAL,
        LEVEL_COUNT
    };

    /*
    * Level level:          set level of Logger
    * const char* file :    set filename of output-file.
    * int   line:           show the line-number of output
    * const char* format:   show the log what you want.
    */
    void log(Level level,const char* file,int line,const char* format,...);
    
    static Logger* get_instance();
    void open(const std::string& filename);
    void close();
    void level(Logger::Level Level);
    void max(size_t max);
    void rotate();
private:
    Logger();
    ~Logger();
    
private:
    static Logger* m_instance;

    static const char* s_level[LEVEL_COUNT];

    std::string m_filename;

    std::ofstream m_fout;

    size_t max_size;

    size_t cur_size;

    Level m_level;
};

}//namespace utility end
}//namespace jjm end
#endif //logger.h end 