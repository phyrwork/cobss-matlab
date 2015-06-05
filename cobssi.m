classdef cobssi < handle
    %COBSSI Consistent Overhead Byte Stuffing Streaming decoder
    % Byte-wise (streaming) COBS decode - see
    % http://www.stuartcheshire.org/papers/cobsforton.pdf for algorithm
    % details
    
    properties
        data = uint8.empty;
        code = 1; % 
        count = 0; %
    end
    
    methods        
        function obj = push(obj, data)
            if obj.count == 0 % read a new stuffing code
                obj.code = data;
                obj.count = obj.code - 1;
            else
                obj.data(end+1) = data;
                obj.count = obj.count - 1;
            end
            
            if obj.count == 0 && obj.code ~= 255
                obj.data(end+1) = 0;
            end
        end
        
        function data = peek(obj)
            data = obj.data;
        end
        
        function data = get(obj)
            if obj.count ~= 0 % if count not zero then current message would be invalid
                error('Decoded message is invalid or incomplete.');
            else
                data = obj.data(1:end-1); % remove the trailing zero
            end
        end
    end  
end

