



function [seam_min]=FindSeam(map)
seam_min = zeros(size(map,1));
cost_min = Inf;
for x=1:size(map,2)
    [seam, cost] = seam_dp(map,x);
    if cost < cost_min
        cost_min = cost;
        seam_min = seam;
    end;
end;

function [seam, cost] = seam_dp(energy, start)
seam = zeros(size(energy,1),1);
dpmap = costmap_dp(energy, start);
[cost, I] = min(dpmap(end,:));
x = I;
seam(end) = x;
for i=size(seam,1)-1:-1:1
    if x==1
        candidate = [Inf dpmap(i,x) dpmap(i,x+1)];
    elseif x==size(dpmap,2)
        candidate = [dpmap(i,x-1) dpmap(i,x) Inf];
    else
        candidate = [dpmap(i,x-1) dpmap(i,x) dpmap(i,x+1)];
    end;
    [Y, I] = min(candidate);
    x = x+I-2;
    seam(i) = x;
end;

function dpmap=costmap_dp(energy, start)
dpmap = energy;
dpmap(1,:) = Inf;
dpmap(1,start) = energy(1,start);
for i=2:size(dpmap,1)
    for x=1:size(dpmap,2)
        if x==1
            candidate = [Inf dpmap(i-1,x) dpmap(i-1,x+1)];
        elseif x==size(dpmap,2)
            candidate = [dpmap(i-1,x-1) dpmap(i-1,x) Inf];
        else
            candidate = [dpmap(i-1,x-1) dpmap(i-1,x) dpmap(i-1,x+1)];
        end;
        [Y, I] = min(candidate);
        dpmap(i,x) = dpmap(i,x) + Y;
    end;
end;        