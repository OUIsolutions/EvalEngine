local runtime = argv.get_flag_arg_by_index({ "runtime" },1)
if not runtime then
  print("\27[31m❌ No --runtime specified\27[0m")
  return
end
local starstwith = argv.get_flag_arg_by_index({ "startswith" },1)
if not starstwith then
  print("\27[31m❌ No --startswith specified\27[0m")
  return
end
local total_sources = argv.get_flag_size({ "sources","src"})
if total_sources == 0 then
  print("\27[31m❌ No --sources specified\27[0m")
  return
end
local args = argv.get_flag_size({ "args"})
local args_cmd = ""
for i=1,args do
    local arg = argv.get_flag_arg_by_index({ "args" },i)
    args_cmd = args_cmd.." "..arg
end

local sources = {}
for i=1,total_sources do
    local src = argv.get_flag_arg_by_index({ "sources","src" },i)
    sources[#sources+1] = src
end
local delay = argv.get_flag_arg_by_index({ "delay" },1) or "0"
delay = tonumber(delay)
if not delay then
    print("\27[31m❌ --delay must be a number\27[0m")
    return
end

while true do 
local all_files = {}
for i =1,#sources do
    if dtw.isfile(sources[i]) then
        all_files[#all_files+1] = sources[i]
    end 
    if dtw.isdir(sources[i]) then
        local files = dtw.list_files_recursively(sources[i],true)
        for j=1,#files do
            all_files[#all_files+1] = files[j]
        end
    end
end 

for i=1,#all_files do
    local current = all_files[i]
    local path = dtw.newPath(current)
    filename = path.get_name()
    if  dtw.starts_with(filename,starstwith) then
        local dir = path.get_dir()
        local command= "cd "..dir.." && "..runtime.." "..filename ..args_cmd
        print("\27[32m🚀 [INFO] Running: \27[36m"..command.."\27[0m")
        os.execute(command)
    end
end 
    if delay > 0 then
        print("\27[33m⏰ [INFO] Waiting \27[35m"..delay.."\27[33m seconds...\27[0m")
        os.execute("sleep "..delay)
    end

end 