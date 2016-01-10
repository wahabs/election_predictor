function accuracy = elections(data,min_range,max_range)

data_nums = zeros(size(data));
data_nums(strcmp(data,'D')) = 1;
data_nums(strcmp(data,'R')) = 2;

function percent = make_prediction(current_year,range,data_nums)
    current = data_nums(current_year,:);
    previous = data_nums((current_year-range):(current_year-1),:);
    prediction = mode(previous);    
    bools = prediction == current;
    percent = sum(bools) / length(bools);
end

accuracy = [];

for range = min_range:max_range
    for yr = (max_range+2):size(data,1)
        accuracy(range,yr-(max_range+1)) = make_prediction(yr,range,data_nums);
    end
end

end