#pragma once
#include "../Reactor/EventLoop.h"
#include "../Base/Condition.h"
#include "../Base/MutexLock.h"
#include "Thread.h"
#include "../Base/noncopyable.h"


class EventLoopThread : noncopyable {
 public:
  EventLoopThread();
  ~EventLoopThread();
  EventLoop* startLoop();

 private:
  void threadFunc();
  EventLoop* loop_;
  bool exiting_;
  Thread thread_;
  MutexLock mutex_;
  Condition cond_;
};