/* This file was automatically generated by CasADi.
   The CasADi copyright holders make no ownership claim of its contents. */
#ifdef __cplusplus
extern "C" {
#endif

/* How to prefix internal symbols */
#ifdef CASADI_CODEGEN_PREFIX
  #define CASADI_NAMESPACE_CONCAT(NS, ID) _CASADI_NAMESPACE_CONCAT(NS, ID)
  #define _CASADI_NAMESPACE_CONCAT(NS, ID) NS ## ID
  #define CASADI_PREFIX(ID) CASADI_NAMESPACE_CONCAT(CODEGEN_PREFIX, ID)
#else
  #define CASADI_PREFIX(ID) g_InverseKinematics_ ## ID
#endif

#include <math.h>

#ifndef casadi_real
#define casadi_real double
#endif

#ifndef casadi_int
#define casadi_int long long int
#endif

/* Add prefix to internal symbols */
#define casadi_f0 CASADI_PREFIX(f0)
#define casadi_f1 CASADI_PREFIX(f1)
#define casadi_f2 CASADI_PREFIX(f2)
#define casadi_s0 CASADI_PREFIX(s0)
#define casadi_s1 CASADI_PREFIX(s1)
#define casadi_s2 CASADI_PREFIX(s2)

/* Symbol visibility in DLLs */
#ifndef CASADI_SYMBOL_EXPORT
  #if defined(_WIN32) || defined(__WIN32__) || defined(__CYGWIN__)
    #if defined(STATIC_LINKED)
      #define CASADI_SYMBOL_EXPORT
    #else
      #define CASADI_SYMBOL_EXPORT __declspec(dllexport)
    #endif
  #elif defined(__GNUC__) && defined(GCC_HASCLASSVISIBILITY)
    #define CASADI_SYMBOL_EXPORT __attribute__ ((visibility ("default")))
  #else
    #define CASADI_SYMBOL_EXPORT
  #endif
#endif

static const casadi_int casadi_s0[7] = {3, 1, 0, 3, 0, 1, 2};
static const casadi_int casadi_s1[10] = {6, 1, 0, 6, 0, 1, 2, 3, 4, 5};
static const casadi_int casadi_s2[14] = {6, 3, 0, 2, 5, 8, 4, 5, 3, 4, 5, 3, 4, 5};

/* g_InverseKinematics_Task:(q[3])->(Task[6]) */
static int casadi_f0(const casadi_real** arg, casadi_real** res, casadi_int* iw, casadi_real* w, int mem) {
  casadi_real a0, a1, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a2, a20, a21, a22, a23, a24, a25, a26, a27, a28, a3, a4, a5, a6, a7, a8, a9;
  a0=6.8300000000000005e-01;
  if (res[0]!=0) res[0][0]=a0;
  a0=3.7200000000000000e-01;
  if (res[0]!=0) res[0][1]=a0;
  a0=5.0000000000000000e-01;
  if (res[0]!=0) res[0][2]=a0;
  a0=5.9999999999999998e-02;
  a1=-1.8300000000000000e-01;
  a2=-2.0000000000000001e-01;
  a3=arg[0]? arg[0][1] : 0;
  a4=sin(a3);
  a5=(a2*a4);
  a5=(a1+a5);
  a6=2.7755575615628914e-17;
  a7=cos(a3);
  a8=-2.3344536385529172e-01;
  a9=arg[0]? arg[0][2] : 0;
  a10=cos(a9);
  a11=(a8*a10);
  a12=-9.7236992039782388e-01;
  a13=sin(a9);
  a14=(a12*a13);
  a11=(a11-a14);
  a14=(a7*a11);
  a15=9.7236992039782388e-01;
  a10=(a15*a10);
  a13=(a8*a13);
  a10=(a10-a13);
  a13=(a4*a10);
  a14=(a14+a13);
  a13=(a6*a14);
  a16=sin(a9);
  a17=(a8*a16);
  a9=cos(a9);
  a12=(a12*a9);
  a17=(a17+a12);
  a12=(a7*a17);
  a15=(a15*a16);
  a8=(a8*a9);
  a15=(a15+a8);
  a8=(a4*a15);
  a12=(a12+a8);
  a8=(a2*a12);
  a13=(a13+a8);
  a13=(a5+a13);
  a13=(a0*a13);
  a8=1.6600000000000001e-01;
  a9=6.4349999999999997e-03;
  a14=(a9*a14);
  a16=-1.0738800000000000e-01;
  a12=(a16*a12);
  a14=(a14+a12);
  a5=(a5+a14);
  a5=(a8*a5);
  a14=1.0129999999999999e+00;
  a12=-3.2369999999999999e-03;
  a7=(a12*a7);
  a18=-2.7326000000000000e-02;
  a4=(a18*a4);
  a7=(a7+a4);
  a1=(a1+a7);
  a1=(a14*a1);
  a7=2.8010559000000007e-01;
  a1=(a1+a7);
  a5=(a5+a1);
  a13=(a13+a5);
  a5=1.2454000000000001e+01;
  a13=(a13/a5);
  if (res[0]!=0) res[0][3]=a13;
  a13=-4.7000000000000000e-02;
  a1=-8.5050000000000001e-02;
  a7=arg[0]? arg[0][0] : 0;
  a4=cos(a7);
  a19=(a1*a4);
  a19=(a13+a19);
  a20=sin(a7);
  a21=cos(a3);
  a22=(a20*a21);
  a23=(a2*a22);
  a23=(a19-a23);
  a3=sin(a3);
  a24=(a20*a3);
  a25=(a24*a11);
  a26=(a22*a10);
  a25=(a25-a26);
  a26=(a6*a25);
  a27=(a24*a17);
  a28=(a22*a15);
  a27=(a27-a28);
  a28=(a2*a27);
  a26=(a26+a28);
  a26=(a23+a26);
  a26=(a0*a26);
  a25=(a9*a25);
  a27=(a16*a27);
  a25=(a25+a27);
  a23=(a23+a25);
  a23=(a8*a23);
  a24=(a12*a24);
  a25=2.2327000000000000e-02;
  a27=(a25*a4);
  a24=(a24+a27);
  a22=(a18*a22);
  a24=(a24-a22);
  a19=(a19+a24);
  a19=(a14*a19);
  a24=6.9599999999999995e-01;
  a22=-6.3500000000000004e-04;
  a4=(a22*a4);
  a27=3.1000000000000001e-05;
  a20=(a27*a20);
  a4=(a4-a20);
  a13=(a13+a4);
  a13=(a24*a13);
  a4=1.8444927700000002e-01;
  a13=(a13+a4);
  a19=(a19+a13);
  a23=(a23+a19);
  a26=(a26+a23);
  a26=(a26/a5);
  if (res[0]!=0) res[0][4]=a26;
  a26=sin(a7);
  a1=(a1*a26);
  a7=cos(a7);
  a21=(a7*a21);
  a23=(a2*a21);
  a23=(a1+a23);
  a10=(a21*a10);
  a3=(a7*a3);
  a11=(a3*a11);
  a10=(a10-a11);
  a6=(a6*a10);
  a15=(a21*a15);
  a17=(a3*a17);
  a15=(a15-a17);
  a2=(a2*a15);
  a6=(a6+a2);
  a6=(a23+a6);
  a0=(a0*a6);
  a9=(a9*a10);
  a16=(a16*a15);
  a9=(a9+a16);
  a23=(a23+a9);
  a8=(a8*a23);
  a25=(a25*a26);
  a12=(a12*a3);
  a25=(a25-a12);
  a18=(a18*a21);
  a25=(a25+a18);
  a1=(a1+a25);
  a14=(a14*a1);
  a22=(a22*a26);
  a27=(a27*a7);
  a22=(a22+a27);
  a24=(a24*a22);
  a22=-3.0563101500000001e-01;
  a24=(a24+a22);
  a14=(a14+a24);
  a8=(a8+a14);
  a0=(a0+a8);
  a0=(a0/a5);
  if (res[0]!=0) res[0][5]=a0;
  return 0;
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_Task(const casadi_real** arg, casadi_real** res, casadi_int* iw, casadi_real* w, int mem){
  return casadi_f0(arg, res, iw, w, mem);
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_Task_alloc_mem(void) {
  return 0;
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_Task_init_mem(int mem) {
  return 0;
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_Task_free_mem(int mem) {
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_Task_checkout(void) {
  return 0;
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_Task_release(int mem) {
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_Task_incref(void) {
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_Task_decref(void) {
}

CASADI_SYMBOL_EXPORT casadi_int g_InverseKinematics_Task_n_in(void) { return 1;}

CASADI_SYMBOL_EXPORT casadi_int g_InverseKinematics_Task_n_out(void) { return 1;}

CASADI_SYMBOL_EXPORT casadi_real g_InverseKinematics_Task_default_in(casadi_int i){
  switch (i) {
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const char* g_InverseKinematics_Task_name_in(casadi_int i){
  switch (i) {
    case 0: return "q";
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const char* g_InverseKinematics_Task_name_out(casadi_int i){
  switch (i) {
    case 0: return "Task";
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const casadi_int* g_InverseKinematics_Task_sparsity_in(casadi_int i) {
  switch (i) {
    case 0: return casadi_s0;
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const casadi_int* g_InverseKinematics_Task_sparsity_out(casadi_int i) {
  switch (i) {
    case 0: return casadi_s1;
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_Task_work(casadi_int *sz_arg, casadi_int* sz_res, casadi_int *sz_iw, casadi_int *sz_w) {
  if (sz_arg) *sz_arg = 1;
  if (sz_res) *sz_res = 1;
  if (sz_iw) *sz_iw = 0;
  if (sz_w) *sz_w = 0;
  return 0;
}

/* g_InverseKinematics_TaskJacobian:(q[3])->(TaskJacobian[6x3,8nz]) */
static int casadi_f1(const casadi_real** arg, casadi_real** res, casadi_int* iw, casadi_real* w, int mem) {
  casadi_real a0, a1, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a2, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a3, a30, a31, a32, a33, a34, a35, a4, a5, a6, a7, a8, a9;
  a0=8.0295487393608478e-02;
  a1=5.9999999999999998e-02;
  a2=2.7755575615628914e-17;
  a3=-2.3344536385529172e-01;
  a4=arg[0]? arg[0][2] : 0;
  a5=cos(a4);
  a6=(a3*a5);
  a7=-9.7236992039782388e-01;
  a8=sin(a4);
  a9=(a7*a8);
  a6=(a6-a9);
  a9=arg[0]? arg[0][1] : 0;
  a10=sin(a9);
  a11=arg[0]? arg[0][0] : 0;
  a12=cos(a11);
  a13=(a10*a12);
  a14=(a6*a13);
  a15=9.7236992039782388e-01;
  a5=(a15*a5);
  a8=(a3*a8);
  a5=(a5-a8);
  a8=cos(a9);
  a16=(a8*a12);
  a17=(a5*a16);
  a14=(a14-a17);
  a17=(a2*a14);
  a18=-2.0000000000000001e-01;
  a19=sin(a4);
  a20=(a3*a19);
  a21=cos(a4);
  a22=(a7*a21);
  a20=(a20+a22);
  a22=(a20*a13);
  a19=(a15*a19);
  a21=(a3*a21);
  a19=(a19+a21);
  a21=(a19*a16);
  a22=(a22-a21);
  a21=(a18*a22);
  a17=(a17+a21);
  a21=-8.5050000000000001e-02;
  a23=sin(a11);
  a24=(a21*a23);
  a25=(a18*a16);
  a25=(a24+a25);
  a17=(a17-a25);
  a17=(a1*a17);
  a26=1.6600000000000001e-01;
  a27=6.4349999999999997e-03;
  a14=(a27*a14);
  a28=-1.0738800000000000e-01;
  a22=(a28*a22);
  a14=(a14+a22);
  a14=(a14-a25);
  a14=(a26*a14);
  a25=1.0129999999999999e+00;
  a22=-3.2369999999999999e-03;
  a13=(a22*a13);
  a29=2.2327000000000000e-02;
  a30=(a29*a23);
  a13=(a13-a30);
  a30=-2.7326000000000000e-02;
  a16=(a30*a16);
  a13=(a13-a16);
  a13=(a13-a24);
  a13=(a25*a13);
  a24=6.9599999999999995e-01;
  a16=-6.3500000000000004e-04;
  a23=(a16*a23);
  a31=3.1000000000000001e-05;
  a12=(a31*a12);
  a23=(a23+a12);
  a23=(a24*a23);
  a13=(a13-a23);
  a14=(a14+a13);
  a17=(a17+a14);
  a17=(a0*a17);
  if (res[0]!=0) res[0][0]=a17;
  a17=cos(a11);
  a21=(a21*a17);
  a14=sin(a11);
  a13=(a8*a14);
  a23=(a18*a13);
  a23=(a21-a23);
  a12=(a10*a14);
  a32=(a6*a12);
  a33=(a5*a13);
  a32=(a32-a33);
  a33=(a2*a32);
  a34=(a20*a12);
  a35=(a19*a13);
  a34=(a34-a35);
  a35=(a18*a34);
  a33=(a33+a35);
  a33=(a23+a33);
  a33=(a1*a33);
  a32=(a27*a32);
  a34=(a28*a34);
  a32=(a32+a34);
  a23=(a23+a32);
  a23=(a26*a23);
  a29=(a29*a17);
  a12=(a22*a12);
  a29=(a29+a12);
  a13=(a30*a13);
  a29=(a29-a13);
  a21=(a21+a29);
  a21=(a25*a21);
  a16=(a16*a17);
  a31=(a31*a14);
  a16=(a16-a31);
  a24=(a24*a16);
  a21=(a21+a24);
  a23=(a23+a21);
  a33=(a33+a23);
  a33=(a0*a33);
  if (res[0]!=0) res[0][1]=a33;
  a33=cos(a9);
  a23=(a18*a33);
  a21=(a5*a33);
  a24=sin(a9);
  a16=(a6*a24);
  a21=(a21-a16);
  a16=(a2*a21);
  a31=(a19*a33);
  a14=(a20*a24);
  a31=(a31-a14);
  a14=(a18*a31);
  a16=(a16+a14);
  a16=(a23+a16);
  a16=(a1*a16);
  a21=(a27*a21);
  a31=(a28*a31);
  a21=(a21+a31);
  a23=(a23+a21);
  a23=(a26*a23);
  a33=(a30*a33);
  a24=(a22*a24);
  a33=(a33-a24);
  a33=(a25*a33);
  a23=(a23+a33);
  a16=(a16+a23);
  a16=(a0*a16);
  if (res[0]!=0) res[0][2]=a16;
  a16=sin(a11);
  a23=sin(a9);
  a33=(a16*a23);
  a24=(a18*a33);
  a21=cos(a9);
  a31=(a16*a21);
  a14=(a6*a31);
  a17=(a5*a33);
  a14=(a14+a17);
  a17=(a2*a14);
  a29=(a20*a31);
  a13=(a19*a33);
  a29=(a29+a13);
  a13=(a18*a29);
  a17=(a17+a13);
  a17=(a24+a17);
  a17=(a1*a17);
  a14=(a27*a14);
  a29=(a28*a29);
  a14=(a14+a29);
  a24=(a24+a14);
  a24=(a26*a24);
  a31=(a22*a31);
  a33=(a30*a33);
  a31=(a31+a33);
  a31=(a25*a31);
  a24=(a24+a31);
  a17=(a17+a24);
  a17=(a0*a17);
  if (res[0]!=0) res[0][3]=a17;
  a11=cos(a11);
  a23=(a11*a23);
  a17=(a18*a23);
  a5=(a5*a23);
  a21=(a11*a21);
  a6=(a6*a21);
  a5=(a5+a6);
  a6=(a2*a5);
  a19=(a19*a23);
  a20=(a20*a21);
  a19=(a19+a20);
  a20=(a18*a19);
  a6=(a6+a20);
  a6=(a17+a6);
  a6=(a1*a6);
  a5=(a27*a5);
  a19=(a28*a19);
  a5=(a5+a19);
  a17=(a17+a5);
  a17=(a26*a17);
  a22=(a22*a21);
  a30=(a30*a23);
  a22=(a22+a30);
  a25=(a25*a22);
  a17=(a17+a25);
  a6=(a6+a17);
  a6=(a0*a6);
  a6=(-a6);
  if (res[0]!=0) res[0][4]=a6;
  a6=cos(a9);
  a17=cos(a4);
  a25=(a3*a17);
  a22=sin(a4);
  a30=(a7*a22);
  a25=(a25-a30);
  a30=(a6*a25);
  a9=sin(a9);
  a17=(a15*a17);
  a22=(a3*a22);
  a17=(a17-a22);
  a22=(a9*a17);
  a30=(a30+a22);
  a22=(a18*a30);
  a23=sin(a4);
  a21=(a3*a23);
  a4=cos(a4);
  a7=(a7*a4);
  a21=(a21+a7);
  a6=(a6*a21);
  a15=(a15*a23);
  a3=(a3*a4);
  a15=(a15+a3);
  a9=(a9*a15);
  a6=(a6+a9);
  a9=(a2*a6);
  a22=(a22-a9);
  a22=(a1*a22);
  a30=(a28*a30);
  a6=(a27*a6);
  a30=(a30-a6);
  a30=(a26*a30);
  a22=(a22+a30);
  a22=(a0*a22);
  if (res[0]!=0) res[0][5]=a22;
  a22=(a16*a8);
  a30=(a22*a15);
  a16=(a16*a10);
  a6=(a16*a21);
  a30=(a30-a6);
  a6=(a2*a30);
  a16=(a16*a25);
  a22=(a22*a17);
  a16=(a16-a22);
  a22=(a18*a16);
  a6=(a6+a22);
  a6=(a1*a6);
  a30=(a27*a30);
  a16=(a28*a16);
  a30=(a30+a16);
  a30=(a26*a30);
  a6=(a6+a30);
  a6=(a0*a6);
  if (res[0]!=0) res[0][6]=a6;
  a10=(a11*a10);
  a21=(a10*a21);
  a11=(a11*a8);
  a15=(a11*a15);
  a21=(a21-a15);
  a2=(a2*a21);
  a11=(a11*a17);
  a10=(a10*a25);
  a11=(a11-a10);
  a18=(a18*a11);
  a2=(a2+a18);
  a1=(a1*a2);
  a27=(a27*a21);
  a28=(a28*a11);
  a27=(a27+a28);
  a26=(a26*a27);
  a1=(a1+a26);
  a0=(a0*a1);
  if (res[0]!=0) res[0][7]=a0;
  return 0;
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian(const casadi_real** arg, casadi_real** res, casadi_int* iw, casadi_real* w, int mem){
  return casadi_f1(arg, res, iw, w, mem);
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_alloc_mem(void) {
  return 0;
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_init_mem(int mem) {
  return 0;
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_TaskJacobian_free_mem(int mem) {
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_checkout(void) {
  return 0;
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_TaskJacobian_release(int mem) {
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_TaskJacobian_incref(void) {
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_TaskJacobian_decref(void) {
}

CASADI_SYMBOL_EXPORT casadi_int g_InverseKinematics_TaskJacobian_n_in(void) { return 1;}

CASADI_SYMBOL_EXPORT casadi_int g_InverseKinematics_TaskJacobian_n_out(void) { return 1;}

CASADI_SYMBOL_EXPORT casadi_real g_InverseKinematics_TaskJacobian_default_in(casadi_int i){
  switch (i) {
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const char* g_InverseKinematics_TaskJacobian_name_in(casadi_int i){
  switch (i) {
    case 0: return "q";
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const char* g_InverseKinematics_TaskJacobian_name_out(casadi_int i){
  switch (i) {
    case 0: return "TaskJacobian";
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const casadi_int* g_InverseKinematics_TaskJacobian_sparsity_in(casadi_int i) {
  switch (i) {
    case 0: return casadi_s0;
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const casadi_int* g_InverseKinematics_TaskJacobian_sparsity_out(casadi_int i) {
  switch (i) {
    case 0: return casadi_s2;
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_work(casadi_int *sz_arg, casadi_int* sz_res, casadi_int *sz_iw, casadi_int *sz_w) {
  if (sz_arg) *sz_arg = 1;
  if (sz_res) *sz_res = 1;
  if (sz_iw) *sz_iw = 0;
  if (sz_w) *sz_w = 0;
  return 0;
}

/* g_InverseKinematics_TaskJacobian_derivative:(q[3],v[3])->(TaskJacobian_derivative[6x3,8nz]) */
static int casadi_f2(const casadi_real** arg, casadi_real** res, casadi_int* iw, casadi_real* w, int mem) {
  casadi_real a0, a1, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a2, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a3, a30, a31, a32, a33, a34, a35, a36, a37, a38, a39, a4, a40, a41, a42, a43, a44, a5, a6, a7, a8, a9;
  a0=8.0295487393608478e-02;
  a1=5.9999999999999998e-02;
  a2=2.7755575615628914e-17;
  a3=9.7236992039782388e-01;
  a4=arg[0]? arg[0][2] : 0;
  a5=cos(a4);
  a6=(a3*a5);
  a7=-2.3344536385529172e-01;
  a8=sin(a4);
  a9=(a7*a8);
  a6=(a6-a9);
  a9=arg[0]? arg[0][1] : 0;
  a10=cos(a9);
  a11=arg[0]? arg[0][0] : 0;
  a12=sin(a11);
  a13=(a10*a12);
  a14=(a6*a13);
  a5=(a7*a5);
  a15=-9.7236992039782388e-01;
  a8=(a15*a8);
  a5=(a5-a8);
  a8=sin(a9);
  a16=(a8*a12);
  a17=(a5*a16);
  a14=(a14-a17);
  a17=(a2*a14);
  a18=-2.0000000000000001e-01;
  a19=sin(a4);
  a20=(a3*a19);
  a21=cos(a4);
  a22=(a7*a21);
  a20=(a20+a22);
  a22=(a20*a13);
  a19=(a7*a19);
  a21=(a15*a21);
  a19=(a19+a21);
  a21=(a19*a16);
  a22=(a22-a21);
  a21=(a18*a22);
  a17=(a17+a21);
  a21=-8.5050000000000001e-02;
  a23=cos(a11);
  a24=(a21*a23);
  a25=(a18*a13);
  a25=(a24-a25);
  a17=(a17-a25);
  a17=(a1*a17);
  a26=1.6600000000000001e-01;
  a27=6.4349999999999997e-03;
  a14=(a27*a14);
  a28=-1.0738800000000000e-01;
  a22=(a28*a22);
  a14=(a14+a22);
  a14=(a14-a25);
  a14=(a26*a14);
  a25=1.0129999999999999e+00;
  a22=-2.7326000000000000e-02;
  a13=(a22*a13);
  a29=-3.2369999999999999e-03;
  a16=(a29*a16);
  a30=2.2327000000000000e-02;
  a31=(a30*a23);
  a16=(a16+a31);
  a13=(a13-a16);
  a13=(a13-a24);
  a13=(a25*a13);
  a24=6.9599999999999995e-01;
  a16=-6.3500000000000004e-04;
  a23=(a16*a23);
  a31=3.1000000000000001e-05;
  a12=(a31*a12);
  a23=(a23-a12);
  a23=(a24*a23);
  a13=(a13-a23);
  a14=(a14+a13);
  a17=(a17+a14);
  a17=(a0*a17);
  a14=arg[1]? arg[1][0] : 0;
  a17=(a17*a14);
  a13=cos(a11);
  a23=cos(a9);
  a12=(a13*a23);
  a32=(a5*a12);
  a33=sin(a9);
  a34=(a13*a33);
  a35=(a6*a34);
  a32=(a32+a35);
  a35=(a2*a32);
  a36=(a19*a12);
  a37=(a20*a34);
  a36=(a36+a37);
  a37=(a18*a36);
  a35=(a35+a37);
  a37=(a18*a34);
  a35=(a35+a37);
  a35=(a1*a35);
  a32=(a27*a32);
  a36=(a28*a36);
  a32=(a32+a36);
  a32=(a32+a37);
  a32=(a26*a32);
  a12=(a29*a12);
  a34=(a22*a34);
  a12=(a12+a34);
  a12=(a25*a12);
  a32=(a32+a12);
  a35=(a35+a32);
  a35=(a0*a35);
  a32=arg[1]? arg[1][1] : 0;
  a35=(a35*a32);
  a17=(a17+a35);
  a35=(a10*a13);
  a12=sin(a4);
  a34=(a3*a12);
  a37=cos(a4);
  a36=(a7*a37);
  a34=(a34+a36);
  a36=(a35*a34);
  a13=(a8*a13);
  a12=(a7*a12);
  a37=(a15*a37);
  a12=(a12+a37);
  a37=(a13*a12);
  a36=(a36-a37);
  a37=(a2*a36);
  a38=cos(a4);
  a39=(a7*a38);
  a40=sin(a4);
  a41=(a15*a40);
  a39=(a39-a41);
  a13=(a13*a39);
  a38=(a3*a38);
  a40=(a7*a40);
  a38=(a38-a40);
  a35=(a35*a38);
  a13=(a13-a35);
  a35=(a18*a13);
  a37=(a37+a35);
  a37=(a1*a37);
  a36=(a27*a36);
  a13=(a28*a13);
  a36=(a36+a13);
  a36=(a26*a36);
  a37=(a37+a36);
  a37=(a0*a37);
  a36=arg[1]? arg[1][2] : 0;
  a37=(a37*a36);
  a17=(a17+a37);
  if (res[0]!=0) res[0][0]=a17;
  a17=cos(a11);
  a37=(a8*a17);
  a13=(a5*a37);
  a35=(a10*a17);
  a40=(a6*a35);
  a13=(a13-a40);
  a40=(a2*a13);
  a41=(a19*a37);
  a42=(a20*a35);
  a41=(a41-a42);
  a42=(a18*a41);
  a40=(a40+a42);
  a42=sin(a11);
  a21=(a21*a42);
  a43=(a18*a35);
  a43=(a21+a43);
  a40=(a40-a43);
  a40=(a1*a40);
  a13=(a27*a13);
  a41=(a28*a41);
  a13=(a13+a41);
  a13=(a13-a43);
  a13=(a26*a13);
  a37=(a29*a37);
  a30=(a30*a42);
  a37=(a37-a30);
  a35=(a22*a35);
  a37=(a37-a35);
  a37=(a37-a21);
  a37=(a25*a37);
  a16=(a16*a42);
  a31=(a31*a17);
  a16=(a16+a31);
  a24=(a24*a16);
  a37=(a37-a24);
  a13=(a13+a37);
  a40=(a40+a13);
  a40=(a0*a40);
  a40=(a40*a14);
  a13=sin(a11);
  a37=(a13*a33);
  a24=(a18*a37);
  a16=(a13*a23);
  a31=(a5*a16);
  a17=(a6*a37);
  a31=(a31+a17);
  a17=(a2*a31);
  a42=(a19*a16);
  a21=(a20*a37);
  a42=(a42+a21);
  a21=(a18*a42);
  a17=(a17+a21);
  a17=(a24+a17);
  a17=(a1*a17);
  a31=(a27*a31);
  a42=(a28*a42);
  a31=(a31+a42);
  a24=(a24+a31);
  a24=(a26*a24);
  a16=(a29*a16);
  a37=(a22*a37);
  a16=(a16+a37);
  a16=(a25*a16);
  a24=(a24+a16);
  a17=(a17+a24);
  a17=(a0*a17);
  a17=(a17*a32);
  a40=(a40+a17);
  a17=(a10*a13);
  a24=(a17*a34);
  a13=(a8*a13);
  a16=(a13*a12);
  a24=(a24-a16);
  a16=(a2*a24);
  a13=(a13*a39);
  a17=(a17*a38);
  a13=(a13-a17);
  a17=(a18*a13);
  a16=(a16+a17);
  a16=(a1*a16);
  a24=(a27*a24);
  a13=(a28*a13);
  a24=(a24+a13);
  a24=(a26*a24);
  a16=(a16+a24);
  a16=(a0*a16);
  a16=(a16*a36);
  a40=(a40+a16);
  if (res[0]!=0) res[0][1]=a40;
  a40=sin(a9);
  a16=(a40*a12);
  a24=cos(a9);
  a13=(a24*a34);
  a16=(a16-a13);
  a13=(a2*a16);
  a24=(a24*a38);
  a40=(a40*a39);
  a24=(a24-a40);
  a40=(a18*a24);
  a13=(a13+a40);
  a13=(a1*a13);
  a16=(a27*a16);
  a24=(a28*a24);
  a16=(a16+a24);
  a16=(a26*a16);
  a13=(a13+a16);
  a13=(a0*a13);
  a13=(a13*a36);
  a16=sin(a9);
  a24=(a18*a16);
  a40=(a6*a16);
  a17=cos(a9);
  a37=(a5*a17);
  a40=(a40+a37);
  a37=(a2*a40);
  a31=(a20*a16);
  a42=(a19*a17);
  a31=(a31+a42);
  a42=(a18*a31);
  a37=(a37+a42);
  a37=(a24+a37);
  a37=(a1*a37);
  a40=(a27*a40);
  a31=(a28*a31);
  a40=(a40+a31);
  a24=(a24+a40);
  a24=(a26*a24);
  a16=(a22*a16);
  a17=(a29*a17);
  a16=(a16+a17);
  a16=(a25*a16);
  a24=(a24+a16);
  a37=(a37+a24);
  a37=(a0*a37);
  a37=(a37*a32);
  a13=(a13-a37);
  if (res[0]!=0) res[0][2]=a13;
  a13=sin(a9);
  a37=cos(a11);
  a24=(a13*a37);
  a16=(a18*a24);
  a17=cos(a9);
  a40=(a17*a37);
  a31=(a5*a40);
  a42=(a6*a24);
  a31=(a31+a42);
  a42=(a2*a31);
  a21=(a19*a40);
  a35=(a20*a24);
  a21=(a21+a35);
  a35=(a18*a21);
  a42=(a42+a35);
  a42=(a16+a42);
  a42=(a1*a42);
  a31=(a27*a31);
  a21=(a28*a21);
  a31=(a31+a21);
  a16=(a16+a31);
  a16=(a26*a16);
  a40=(a29*a40);
  a24=(a22*a24);
  a40=(a40+a24);
  a40=(a25*a40);
  a16=(a16+a40);
  a42=(a42+a16);
  a42=(a0*a42);
  a42=(a42*a14);
  a16=sin(a11);
  a40=cos(a9);
  a24=(a16*a40);
  a31=(a18*a24);
  a21=(a6*a24);
  a35=sin(a9);
  a30=(a16*a35);
  a43=(a5*a30);
  a21=(a21-a43);
  a43=(a2*a21);
  a41=(a20*a24);
  a44=(a19*a30);
  a41=(a41-a44);
  a44=(a18*a41);
  a43=(a43+a44);
  a43=(a31+a43);
  a43=(a1*a43);
  a21=(a27*a21);
  a41=(a28*a41);
  a21=(a21+a41);
  a31=(a31+a21);
  a31=(a26*a31);
  a24=(a22*a24);
  a30=(a29*a30);
  a24=(a24-a30);
  a24=(a25*a24);
  a31=(a31+a24);
  a43=(a43+a31);
  a43=(a0*a43);
  a43=(a43*a32);
  a42=(a42+a43);
  a43=(a16*a17);
  a31=(a43*a39);
  a24=(a16*a13);
  a30=(a24*a38);
  a31=(a31+a30);
  a30=(a18*a31);
  a43=(a43*a12);
  a24=(a24*a34);
  a43=(a43+a24);
  a24=(a2*a43);
  a30=(a30-a24);
  a30=(a1*a30);
  a31=(a28*a31);
  a43=(a27*a43);
  a31=(a31-a43);
  a31=(a26*a31);
  a30=(a30+a31);
  a30=(a0*a30);
  a30=(a30*a36);
  a42=(a42+a30);
  if (res[0]!=0) res[0][3]=a42;
  a42=sin(a11);
  a30=(a13*a42);
  a31=(a18*a30);
  a43=(a6*a30);
  a24=(a17*a42);
  a21=(a5*a24);
  a43=(a43+a21);
  a21=(a2*a43);
  a41=(a20*a30);
  a44=(a19*a24);
  a41=(a41+a44);
  a44=(a18*a41);
  a21=(a21+a44);
  a21=(a31+a21);
  a21=(a1*a21);
  a43=(a27*a43);
  a41=(a28*a41);
  a43=(a43+a41);
  a31=(a31+a43);
  a31=(a26*a31);
  a24=(a29*a24);
  a30=(a22*a30);
  a24=(a24+a30);
  a24=(a25*a24);
  a31=(a31+a24);
  a21=(a21+a31);
  a21=(a0*a21);
  a21=(a21*a14);
  a11=cos(a11);
  a40=(a11*a40);
  a31=(a18*a40);
  a6=(a6*a40);
  a35=(a11*a35);
  a5=(a5*a35);
  a6=(a6-a5);
  a5=(a2*a6);
  a20=(a20*a40);
  a19=(a19*a35);
  a20=(a20-a19);
  a19=(a18*a20);
  a5=(a5+a19);
  a5=(a31+a5);
  a5=(a1*a5);
  a6=(a27*a6);
  a20=(a28*a20);
  a6=(a6+a20);
  a31=(a31+a6);
  a31=(a26*a31);
  a22=(a22*a40);
  a29=(a29*a35);
  a22=(a22-a29);
  a25=(a25*a22);
  a31=(a31+a25);
  a5=(a5+a31);
  a5=(a0*a5);
  a5=(a5*a32);
  a21=(a21-a5);
  a13=(a11*a13);
  a38=(a13*a38);
  a17=(a11*a17);
  a39=(a17*a39);
  a38=(a38+a39);
  a39=(a18*a38);
  a13=(a13*a34);
  a17=(a17*a12);
  a13=(a13+a17);
  a17=(a2*a13);
  a39=(a39-a17);
  a39=(a1*a39);
  a38=(a28*a38);
  a13=(a27*a13);
  a38=(a38-a13);
  a38=(a26*a38);
  a39=(a39+a38);
  a39=(a0*a39);
  a39=(a39*a36);
  a21=(a21-a39);
  if (res[0]!=0) res[0][4]=a21;
  a21=cos(a4);
  a39=(a3*a21);
  a38=sin(a4);
  a13=(a7*a38);
  a39=(a39-a13);
  a13=cos(a9);
  a17=(a39*a13);
  a21=(a7*a21);
  a38=(a15*a38);
  a21=(a21-a38);
  a38=sin(a9);
  a12=(a21*a38);
  a17=(a17-a12);
  a12=(a18*a17);
  a34=sin(a4);
  a5=(a3*a34);
  a31=cos(a4);
  a25=(a7*a31);
  a5=(a5+a25);
  a13=(a5*a13);
  a34=(a7*a34);
  a31=(a15*a31);
  a34=(a34+a31);
  a38=(a34*a38);
  a13=(a13-a38);
  a38=(a2*a13);
  a12=(a12-a38);
  a12=(a1*a12);
  a17=(a28*a17);
  a13=(a27*a13);
  a17=(a17-a13);
  a17=(a26*a17);
  a12=(a12+a17);
  a12=(a0*a12);
  a12=(a12*a32);
  a17=cos(a9);
  a13=sin(a4);
  a38=(a7*a13);
  a31=cos(a4);
  a25=(a15*a31);
  a38=(a38+a25);
  a25=(a17*a38);
  a9=sin(a9);
  a13=(a3*a13);
  a31=(a7*a31);
  a13=(a13+a31);
  a31=(a9*a13);
  a25=(a25+a31);
  a31=(a18*a25);
  a22=cos(a4);
  a29=(a7*a22);
  a4=sin(a4);
  a15=(a15*a4);
  a29=(a29-a15);
  a17=(a17*a29);
  a3=(a3*a22);
  a7=(a7*a4);
  a3=(a3-a7);
  a9=(a9*a3);
  a17=(a17+a9);
  a9=(a2*a17);
  a31=(a31+a9);
  a31=(a1*a31);
  a25=(a28*a25);
  a17=(a27*a17);
  a25=(a25+a17);
  a25=(a26*a25);
  a31=(a31+a25);
  a31=(a0*a31);
  a31=(a31*a36);
  a12=(a12-a31);
  if (res[0]!=0) res[0][5]=a12;
  a12=(a10*a37);
  a31=(a5*a12);
  a37=(a8*a37);
  a25=(a34*a37);
  a31=(a31-a25);
  a25=(a2*a31);
  a37=(a21*a37);
  a12=(a39*a12);
  a37=(a37-a12);
  a12=(a18*a37);
  a25=(a25+a12);
  a25=(a1*a25);
  a31=(a27*a31);
  a37=(a28*a37);
  a31=(a31+a37);
  a31=(a26*a31);
  a25=(a25+a31);
  a25=(a0*a25);
  a25=(a25*a14);
  a31=(a16*a23);
  a37=(a21*a31);
  a12=(a16*a33);
  a17=(a39*a12);
  a37=(a37+a17);
  a17=(a18*a37);
  a12=(a5*a12);
  a31=(a34*a31);
  a12=(a12+a31);
  a31=(a2*a12);
  a17=(a17-a31);
  a17=(a1*a17);
  a37=(a28*a37);
  a12=(a27*a12);
  a37=(a37-a12);
  a37=(a26*a37);
  a17=(a17+a37);
  a17=(a0*a17);
  a17=(a17*a32);
  a25=(a25+a17);
  a17=(a16*a10);
  a37=(a17*a3);
  a16=(a16*a8);
  a12=(a16*a29);
  a37=(a37-a12);
  a12=(a2*a37);
  a17=(a17*a13);
  a16=(a16*a38);
  a17=(a17-a16);
  a16=(a18*a17);
  a12=(a12+a16);
  a12=(a1*a12);
  a37=(a27*a37);
  a17=(a28*a17);
  a37=(a37+a17);
  a37=(a26*a37);
  a12=(a12+a37);
  a12=(a0*a12);
  a12=(a12*a36);
  a25=(a25+a12);
  if (res[0]!=0) res[0][6]=a25;
  a25=(a10*a42);
  a12=(a5*a25);
  a42=(a8*a42);
  a37=(a34*a42);
  a12=(a12-a37);
  a37=(a2*a12);
  a42=(a21*a42);
  a25=(a39*a25);
  a42=(a42-a25);
  a25=(a18*a42);
  a37=(a37+a25);
  a37=(a1*a37);
  a12=(a27*a12);
  a42=(a28*a42);
  a12=(a12+a42);
  a12=(a26*a12);
  a37=(a37+a12);
  a37=(a0*a37);
  a37=(a37*a14);
  a23=(a11*a23);
  a34=(a34*a23);
  a33=(a11*a33);
  a5=(a5*a33);
  a34=(a34+a5);
  a5=(a2*a34);
  a39=(a39*a33);
  a21=(a21*a23);
  a39=(a39+a21);
  a21=(a18*a39);
  a5=(a5-a21);
  a5=(a1*a5);
  a34=(a27*a34);
  a39=(a28*a39);
  a34=(a34-a39);
  a34=(a26*a34);
  a5=(a5+a34);
  a5=(a0*a5);
  a5=(a5*a32);
  a37=(a37+a5);
  a8=(a11*a8);
  a29=(a8*a29);
  a11=(a11*a10);
  a3=(a11*a3);
  a29=(a29-a3);
  a2=(a2*a29);
  a8=(a8*a38);
  a11=(a11*a13);
  a8=(a8-a11);
  a18=(a18*a8);
  a2=(a2+a18);
  a1=(a1*a2);
  a27=(a27*a29);
  a28=(a28*a8);
  a27=(a27+a28);
  a26=(a26*a27);
  a1=(a1+a26);
  a0=(a0*a1);
  a0=(a0*a36);
  a37=(a37+a0);
  if (res[0]!=0) res[0][7]=a37;
  return 0;
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_derivative(const casadi_real** arg, casadi_real** res, casadi_int* iw, casadi_real* w, int mem){
  return casadi_f2(arg, res, iw, w, mem);
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_derivative_alloc_mem(void) {
  return 0;
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_derivative_init_mem(int mem) {
  return 0;
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_TaskJacobian_derivative_free_mem(int mem) {
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_derivative_checkout(void) {
  return 0;
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_TaskJacobian_derivative_release(int mem) {
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_TaskJacobian_derivative_incref(void) {
}

CASADI_SYMBOL_EXPORT void g_InverseKinematics_TaskJacobian_derivative_decref(void) {
}

CASADI_SYMBOL_EXPORT casadi_int g_InverseKinematics_TaskJacobian_derivative_n_in(void) { return 2;}

CASADI_SYMBOL_EXPORT casadi_int g_InverseKinematics_TaskJacobian_derivative_n_out(void) { return 1;}

CASADI_SYMBOL_EXPORT casadi_real g_InverseKinematics_TaskJacobian_derivative_default_in(casadi_int i){
  switch (i) {
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const char* g_InverseKinematics_TaskJacobian_derivative_name_in(casadi_int i){
  switch (i) {
    case 0: return "q";
    case 1: return "v";
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const char* g_InverseKinematics_TaskJacobian_derivative_name_out(casadi_int i){
  switch (i) {
    case 0: return "TaskJacobian_derivative";
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const casadi_int* g_InverseKinematics_TaskJacobian_derivative_sparsity_in(casadi_int i) {
  switch (i) {
    case 0: return casadi_s0;
    case 1: return casadi_s0;
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT const casadi_int* g_InverseKinematics_TaskJacobian_derivative_sparsity_out(casadi_int i) {
  switch (i) {
    case 0: return casadi_s2;
    default: return 0;
  }
}

CASADI_SYMBOL_EXPORT int g_InverseKinematics_TaskJacobian_derivative_work(casadi_int *sz_arg, casadi_int* sz_res, casadi_int *sz_iw, casadi_int *sz_w) {
  if (sz_arg) *sz_arg = 2;
  if (sz_res) *sz_res = 1;
  if (sz_iw) *sz_iw = 0;
  if (sz_w) *sz_w = 0;
  return 0;
}


#ifdef __cplusplus
} /* extern "C" */
#endif