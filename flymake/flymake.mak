CC=cl /TC
CXX=cl /TP

# add include path to INCLUDE 
INCLUDE=$(INCLUDE)

# add compiler options to CL
CL=/nologo /W4 /Wp64

check-syntax:
	$(CXX) $(CL) /Zs $(CHK_SOURCES)

