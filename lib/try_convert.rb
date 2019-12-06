
##
# Try to convert _obj_ into an Float, using Kernel::Float method.
# Returns converted float or nil if _obj_ cannot be converted for any
# reason.
#
def Float.try_convert obj
  Float(obj) rescue nil
end

##
# Try to convert _obj_ into an Integer, using Kernel::Integer method.
# Returns converted integer or nil if _obj_ cannot be converted for
# any reason.
#
def Integer.try_convert obj
  Integer(obj) rescue nil
end

##
# Try to convert _obj_ into a Proc, using to_proc method.
# Returns converted proc or nil if _obj_ cannot be converted for any
# reason.
#
def Proc.try_convert obj
  obj.to_proc rescue nil
end

