// 实现单例设计模式

// .h 文件的实现
#define Singleton_h(methodName) + (instancetype)shared##methodName; // ## 拼接字符串


// .m 文件的实现
#if __has_feature(objc_arc) // 是ARC
#define Singleton_m(className,methodName)\
static className *_instance = nil;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
    if (_instance == nil) {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super allocWithZone:zone];\
        });\
    }\
    return _instance;\
}\
- (instancetype)init{\
    \
    if (_instance == nil) {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super init];\
        });\
    }\
    return self;\
}\
\
+ (instancetype)shared##methodName{\
    return [[self alloc]init];\
}\
\
+ (id)copyWithZone:(struct _NSZone *)zone{\
    \
    return _instance;\
}\
\
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{\
    return _instance;\
}


#else // 非ARC


#define Singleton_m(className,methodName)\
static className *_instance = nil;\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
    if (_instance == nil) {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super allocWithZone:zone];\
        });\
    }\
    return _instance;\
}\
- (instancetype)init{\
\
if (_instance == nil) {\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [super init];\
});\
}\
return self;\
}\
\
+ (instancetype)shared##methodName{\
return [[self alloc]init];\
}\
+ (id)copyWithZone:(struct _NSZone *)zone{\
\
return _instance;\
}\
\
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{\
    return _instance;\
}\
\
- (oneway void)release{\
    \
}\
\
- (instancetype)retain{\
    return self;\
}\
\
- (NSUInteger)retainCount{\
    return 1;\
}
#endif