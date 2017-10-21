@ECHO off

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86

if not exist dist32 mkdir dist32
if exist dist32\* del /q dist32\*

cd ..\libndtypes
copy /y Makefile.vc Makefile

nmake clean
nmake

copy /y libndtypes-0.1.0.lib ..\vcbuild\dist32
copy /y libndtypes-0.1.0.dll ..\vcbuild\dist32
copy /y libndtypes-0.1.0.dll.lib ..\vcbuild\dist32
copy /y libndtypes-0.1.0.dll.exp ..\vcbuild\dist32
copy /y ndtypes.h ..\vcbuild\dist32

cd tests
copy /y Makefile.vc Makefile
nmake clean
nmake

copy /y runtest.exe ..\..\vcbuild\dist32
copy /y runtest_shared.exe ..\..\vcbuild\dist32

cd ..\..\vcbuild



