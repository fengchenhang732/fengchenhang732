% 计算两个RS码的码距（每个码字包含7个符号）
function dis = rscode_dis(code1, code2)
    dis = 0;
    for i = 1:7
        % 假设 gf_dis 函数计算符号间距离（需自行实现）
        dis = dis + gf_dis(code1(i), code2(i));
    end
end

% 统计两个矩阵中相同位置元素的匹配数量
function match_count = same(msg, new_msg)
    match_count = sum(msg(:) == new_msg(:)); % 向量化比较提高效率
end

% 生成所有三位八进制组合的矩阵（512×3）
function x = a_msg(~)
    % 使用ndgrid生成所有组合（0-7）
    [d1, d2, d3] = ndgrid(0:7, 0:7, 0:7);
    x = [d1(:), d2(:), d3(:)]; % 组合成512行3列矩阵
end