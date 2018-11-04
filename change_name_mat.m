clear;
clc;
base_path='./result_ori/';
save_path='./result_mytracker/';
template_results_path='./template_results/';
if ~exist(save_path)
    mkdir(save_path);
end
orin_tracker='_ours.mat';
new_tracker='_mytracker.mat';
template_tracker='_SSRCF.mat';
files_ori=dir(base_path);
ori_video={files_ori(3:end).name};
files_template=dir(template_results_path);
template_video={files_template(3:end).name};
for i=1:numel(template_video)
    video_length=length(template_video{i})-length(template_tracker);
    template_video_name{i}=template_video{i}(1:video_length);
    disp(template_video_name{i});
end


for i=1:numel(ori_video)
    video_length=length(ori_video{i})-length(orin_tracker);
    ori_video_name=ori_video{i}(1:video_length);
    for j=1:numel(template_video)
        if strcmp(lower(ori_video_name),lower(template_video_name{j}))
            result_name=[save_path template_video_name{j} new_tracker];
            disp(i);
            disp(result_name);
            load([base_path ori_video{i}]);
            results={results};
            save(result_name,'results');
            break;
        end     
    end      
end
