function interpret_msg = rs_interpret(in_msg, all_code_msg, all_msg)
    % 功能：从RS码本中找到与输入码字距离最短的合法码字，并返回对应原始信息
    % 输入：
    %   in_msg       - 待解码的接收码字（向量）
    %   all_code_msg - 所有合法RS码字集合（矩阵，每行一个码字）
    %   all_msg      - 对应的原始信息集合（矩阵，每行一个信息）
    % 输出：
    %   interpret_msg - 解码后的原始信息
    
    % 动态获取码本大小（替代硬编码512）
    num_codewords = size(all_code_msg, 1);
    rs_dis = zeros(1, num_codewords);  % 预分配内存
    
    % 计算每个码字与输入码字的距离
    for i = 1:num_codewords
        rs_dis(i) = rscode_dis(in_msg, all_code_msg(i, :));
    end
    
    % 找到最小距离及对应索引
    rs_dis_min = min(rs_dis);
    min_indices = find(rs_dis == rs_dis_min);
    
    % 返回第一个最小距离对应的原始信息
    interpret_msg = all_msg(min_indices(1), :);
end