local runtime = argv.get_flag_arg_by_index({ "runtime" },1)
if not runtime then
  print("No --runtime specified")
  return
end
local starstwith = argv.get_flag_arg_by_index({ "starstwith" },1)
if not starstwith then
  print("No --starstwith specified")
  return
end
local total_sources = argv.get_flag_size({ "sources","src"})
if total_sources == 0 then
  print("No --sources specified")
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
        print("[INFO]Running: "..command)
        os.execute(command)
    end
end 