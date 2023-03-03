// #include <linux/time.h>
// #include <linux/ioctl.h>
// #include <linux/types.h>
#include <linux/videodev2.h>
// #include <linux/v4l2-common.h>
// #include <linux/v4l2-controls.h>

#if 0

#define CONSTANT 0xDEADBEEF

#define FUNC(x) (x * x)

struct foo
{
	int a, b;
};

int foo_size = sizeof(struct foo);

#define FOO_FUNC(t) (sizeof(t))

#define FOO_SIZE() FOO_FUNC(struct foo)

#endif
