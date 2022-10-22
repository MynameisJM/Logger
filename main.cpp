
#include "logger.h"
using namespace jjm::utility;

int main()
{
   int age  = 19;
   Logger::get_instance()->open("./log.log");
   Logger::get_instance()->max(128);
   LEVEL(Logger::ERROR)

   DEBUG("DEGUG");
   ERROR("THERE IS A ERROR MESSAGES.");
   INFO("I am ego, aged %d",age);
   WARN("maybe a worry case.");
   FATAL("break down.");
   INFO("id connection faild.");
   
   
   return 0;
}