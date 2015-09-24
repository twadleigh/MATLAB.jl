export mex_err_msg_txt, mex_warn_msg_txt, mex_printf

global libmex
if libmex == C_NULL
    load_libmex()
end
@assert libmex != C_NULL

mex_err_msg_txt(msg) = ccall(mexfunc(:mexErrMsgTxt), Void, (Ptr{Uint8},), ASCIIString(string(msg)))
mex_warn_msg_txt(msg) = ccall(mexfunc(:mexWarnMsgTxt), Void, (Ptr{Uint8},), ASCIIString(string(msg)))
mex_printf(msg) = ccall(mexfunc(:mexPrintf), Int32, (Ptr{Uint8},), ASCIIString(string(msg)))
#mex_eval_string(expr) = ccall(mexfunc(:mexEvalString), Int32, (Ptr{Uint8},), ASCIIString(string(expr)))
#mex_call_matlab()
