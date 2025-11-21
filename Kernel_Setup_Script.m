clear all;


%General Memory Parameters
AmountOfRamBlocksScanlines = 5
AmountOfRamBlocksScanlinesOffset = AmountOfRamBlocksScanlines - 1;
RamBlockSelSizScanlines = ceil(log2(AmountOfRamBlocksScanlines))

%Scanline Memory Parameters
ScanlinePixelBitSize = 72;
ScanlineRamDepth = 73700;
ScanLineAddressSize = ceil(log2(ScanlineRamDepth))
AmountOfScanlinePixels = 73700;
AmountOfScanlinePixelsOffset = AmountOfScanlinePixels - 1;

%Kernel Weight Memory Parameters
KernelWeightBitSize = 72;
KernelRamDepth = 500;
KernelAddressSize = ceil(log2(KernelRamDepth))

% Scanline Memory Controller
ScanlinePixelBitSizeController = 12;
AmountOfPixelsPerScanline = 400; % turn to 400
AmountOfScanlines = 1100;
AmountOfScanlinesOffset = AmountOfScanlines - 1;
ScanlineFifoCheck = ceil(ScanlinePixelBitSize/ScanlinePixelBitSizeController);
UltraRamRowsNeedForScanline = ceil(AmountOfPixelsPerScanline/ScanlineFifoCheck);

TotalSectionsForFrames = AmountOfScanlines/AmountOfRamBlocksScanlines;
TotalSectionsForFramesOffset = TotalSectionsForFrames - 1;




% Amount of Pixels Per Scanline Offset Max (AOPPS_Off)
AOPPS_Off = AmountOfPixelsPerScanline - 1;

FrameBitsPerRow = ScanlinePixelBitSize/ScanlinePixelBitSizeController;

% Pixel Packing 12 Bit Numbers into 72 Bit Memory Row
UltraRamRows = AmountOfPixelsPerScanline/ScanlineFifoCheck;
UltraRamRowsFloor = floor(AmountOfPixelsPerScanline/ScanlineFifoCheck);
UltraRamRowsCeil = ceil(AmountOfPixelsPerScanline/ScanlineFifoCheck);
UltraRamRowsLeft = UltraRamRows - UltraRamRowsFloor;
UltraRamRowsOffset = UltraRamRowsCeil - 1;

UltraRamRowsMemorySectionOffset = UltraRamRowsCeil*AmountOfRamBlocksScanlines;

SanityCheckFramePacker = 0;

FramePackOff_0 = FrameBitsPerRow * UltraRamRowsFloor + 0;
if FramePackOff_0 > AOPPS_Off
    FramePackOff_0 = FramePackOff_0 - ScanlineFifoCheck;
    SanityCheckFramePacker = SanityCheckFramePacker + 1;
end
FramePackOff_1 = FrameBitsPerRow * UltraRamRowsFloor + 1;
if FramePackOff_1 > AOPPS_Off
    FramePackOff_1 = FramePackOff_1 - ScanlineFifoCheck;
    SanityCheckFramePacker = SanityCheckFramePacker + 1;
end
FramePackOff_2 = FrameBitsPerRow * UltraRamRowsFloor + 2;
if FramePackOff_2 > AOPPS_Off
    FramePackOff_2 = FramePackOff_2 - ScanlineFifoCheck;
    SanityCheckFramePacker = SanityCheckFramePacker + 1;
end
FramePackOff_3 = FrameBitsPerRow * UltraRamRowsFloor + 3;
if FramePackOff_3 > AOPPS_Off
    FramePackOff_3 = FramePackOff_3 - ScanlineFifoCheck;
    SanityCheckFramePacker = SanityCheckFramePacker + 1;
end
FramePackOff_4 = FrameBitsPerRow * UltraRamRowsFloor + 4;
if FramePackOff_4 > AOPPS_Off
    FramePackOff_4 = FramePackOff_4 - ScanlineFifoCheck;
    SanityCheckFramePacker = SanityCheckFramePacker + 1;
end
FramePackOff_5 = FrameBitsPerRow * UltraRamRowsFloor + 5;
if FramePackOff_5 > AOPPS_Off
    FramePackOff_5 = FramePackOff_5 - ScanlineFifoCheck;
    SanityCheckFramePacker = SanityCheckFramePacker + 1;
end


if SanityCheckFramePacker == FrameBitsPerRow
    error("Something is wrong check values of the Frame Offset for row packing");
end

FrameValueToCheck = round(FrameBitsPerRow - UltraRamRowsLeft*FrameBitsPerRow);

if  SanityCheckFramePacker ~= FrameValueToCheck
    error("Something is wrong check values of the Frame Offset for row packing, should be equal to UltraRamRowsLeft");
end





% Kernel Weight Memory Controller
KernelWeightBitSizeController = 18;
KernelBitsPerRow = KernelWeightBitSize/KernelWeightBitSizeController;


% 72 Bit Data Type Unsigned no Fracitonal



% Amount of Pixels Per Kernel Offset Max (AOPPK_Off)
AOPPK_Off = AmountOfPixelsPerScanline - 1;

FrameBitsPerRow = ScanlinePixelBitSize/ScanlinePixelBitSizeController;

% Pixel Packing 18 Bit Numbers into 72 Bit Memory Row
UltraRamRowsKernel = AmountOfPixelsPerScanline/KernelBitsPerRow;
UltraRamRowsKernelFloor = floor(AmountOfPixelsPerScanline/KernelBitsPerRow);
UltraRamRowsKernelCeil = ceil(AmountOfPixelsPerScanline/KernelBitsPerRow);
UltraRamRowsKernelLeft = UltraRamRowsKernel - UltraRamRowsKernelFloor;
UltraRamRowsKernelOffset = UltraRamRowsKernelCeil - 1;
UltraRamRowsKernelTotalPixels = AmountOfScanlines * UltraRamRowsKernel;
UltraRamRowsKernelTotalPixelsOffset = UltraRamRowsKernelTotalPixels - 1;

UltraRamRowsMemoryKernelSectionOffset = UltraRamRowsKernelCeil*AmountOfRamBlocksScanlines;

SanityCheckKernelPacker = 0;

KernelPackOff_0 = KernelBitsPerRow * UltraRamRowsKernelFloor + 0;
if KernelPackOff_0 > AOPPK_Off
    KernelPackOff_0 = KernelPackOff_0 - KernelBitsPerRow;
    SanityCheckKernelPacker = SanityCheckKernelPacker + 1;
end
KernelPackOff_1 = KernelBitsPerRow * UltraRamRowsKernelFloor + 1;
if KernelPackOff_1 > AOPPK_Off
    KernelPackOff_1 = KernelPackOff_1 - KernelBitsPerRow;
    SanityCheckKernelPacker = SanityCheckKernelPacker + 1;
end
KernelPackOff_2 = KernelBitsPerRow * UltraRamRowsKernelFloor + 2;
if KernelPackOff_2 > AOPPK_Off
    KernelPackOff_2 = KernelPackOff_2 - KernelBitsPerRow;
    SanityCheckKernelPacker = SanityCheckKernelPacker + 1;
end
KernelPackOff_3 = KernelBitsPerRow * UltraRamRowsKernelFloor + 3;
if KernelPackOff_3 > AOPPK_Off
    KernelPackOff_3 = KernelPackOff_3 - KernelBitsPerRow;
    SanityCheckKernelPacker = SanityCheckKernelPacker + 1;
end







% Caluculation for slicing Bin Spectrual Data
BitSize = ScanlinePixelBitSize;
MsbOffset = (BitSize - 1);
LsbOffset = 0;

%71 downto 60
Slice71DownTo60Top = (MsbOffset - (ScanlinePixelBitSizeController*0));
Slice71DownTo60Botttom = 0;
%59 DownTo 48
Slice59DownTo48Top = (MsbOffset - (ScanlinePixelBitSizeController*1));

%47 DownTo 36
Slice47DownTo36Top = (MsbOffset - (ScanlinePixelBitSizeController*2));

%35 DownTo 24
Slice35DownTo24Top = (MsbOffset - (ScanlinePixelBitSizeController*3));

%23 DownTo 12
Slice23DownTo12Top = (MsbOffset - (ScanlinePixelBitSizeController*4));

%11 DownTo 0
Slice11DownTo0Top = (MsbOffset - (ScanlinePixelBitSizeController*5));

% Caluculation for slicing Bin Spectrual Data
KernelBitSize = KernelWeightBitSize;
KernelMsbOffset = (KernelBitSize - 1);
KernelLsbOffset = 0;

%71 downto 54
KernelSlice71DownTo54Top = (KernelMsbOffset - (KernelWeightBitSizeController*0));

%53 DownTo 36
KernelSlice53DownTo36Top = (KernelMsbOffset - (KernelWeightBitSizeController*1));

%35 DownTo 18
KernelSlice35DownTo18Top = (KernelMsbOffset - (KernelWeightBitSizeController*2));

%17 DownTo 0
KernelSlice17DownTo0Top = (KernelMsbOffset - (KernelWeightBitSizeController*3));


%Test Values
% RAM 0 Values
Ram0_TvalueV0 = 0x111;
Ram0_TvalueV1 = 0x222;
Ram0_TvalueV2 = 0x333;
Ram0_TvalueV3 = 0x444;
Ram0_TvalueV4 = 0x555;
Ram0_TvalueV5 = 0x666;


% RAM 1 Values
Ram1_TvalueV0 = 0x11;
Ram1_TvalueV1 = 0x11;
Ram1_TvalueV2 = 0x11;
Ram1_TvalueV3 = 0x11;
Ram1_TvalueV4 = 0x11;
Ram1_TvalueV5 = 0x11;



% RAM 2 Values
Ram2_TvalueV0 = 0x11;
Ram2_TvalueV1 = 0x11;
Ram2_TvalueV2 = 0x11;
Ram2_TvalueV3 = 0x11;
Ram2_TvalueV4 = 0x11;
Ram2_TvalueV5 = 0x11;



% RAM 0 Values
Ram3_TvalueV0 = 0x11;
Ram3_TvalueV1 = 0x11;
Ram3_TvalueV2 = 0x11;
Ram3_TvalueV3 = 0x11;
Ram3_TvalueV4 = 0x11;
Ram3_TvalueV5 = 0x11;



% RAM 0 Values
Ram4_TvalueV0 = 0x11;
Ram4_TvalueV1 = 0x11;
Ram4_TvalueV2 = 0x11;
Ram4_TvalueV3 = 0x11;
Ram4_TvalueV4 = 0x11;
Ram4_TvalueV5 = 0x11;


% Number of slices for the big matrix (z dimension)
num_slices = 36;

input_data_random = true;
input_value = 0;
input_increment = 1;
input_scalar = 1;
input_max_value = 400; % Maximum value before wrapping back to 0



kernel_data_random = true;
kernel_value = 1;
kernel_increment = 0;
kernel_scalar = 1;

auxillary_kernel_data_random = false;
auxillary_kernel_value = 1;
auxillary_kernel_increment = 0;
auxillary_kernel_scalar = 1;

x_length_input = 1100;
y_height_input = 400;
z_depth_input = num_slices;

x_length_kernel = 5;
y_height_kernel = y_height_input;
z_depth_kernel = 5;


% Create these value in such a way this is what I expect to input into the simulink model

% create a flat input array
if input_data_random == true
    flattened_input_array = randi([1, (2^ScanlinePixelBitSizeController)-1], x_length_input * y_height_input * z_depth_input, 1);
elseif input_data_random == false
    % Generate array with continuous incremental values that wrap at max
    num_elements = x_length_input * y_height_input * z_depth_input;
    continuous_values = input_value + (0:num_elements-1)' * input_increment * input_scalar;
    % Wrap around max value (keeping range from input_value to input_max_value)
    flattened_input_array = mod(continuous_values - input_value, input_max_value) + input_value;
end

%create a flat kernel array
if kernel_data_random == true
    flattened_kernel_array = randi([1, 10], x_length_kernel * y_height_kernel * z_depth_kernel, 1);
elseif kernel_data_random == false
    % Generate array with incremental values and scalar per z-slice
    flattened_kernel_array = zeros(x_length_kernel * y_height_kernel * z_depth_kernel, 1);
    slice_size = x_length_kernel * y_height_kernel;
    
    for i = 1:z_depth_kernel
        start_idx = (i-1) * slice_size + 1;
        end_idx = i * slice_size;
        slice_data = kernel_value + (0:slice_size-1)' * kernel_increment;
        flattened_kernel_array(start_idx:end_idx) = slice_data * (kernel_scalar * i);
    end
end

%create a boolean array for both the input and kernel data so that simulink knows which data is valid
flattened_input_bool_array = true(x_length_input * y_height_input * z_depth_input, 1);
flattened_kernel_bool_array = true(x_length_kernel * y_height_kernel * z_depth_kernel, 1);

%create a timeseries for both the input and kernel data so that simulink knows which data is valid and the valid lines
input_timeseries = timeseries(flattened_input_array);
input_valid_timeseries = timeseries(flattened_input_bool_array);
kernel_timeseries = timeseries(flattened_kernel_array);
kernel_valid_timeseries = timeseries(flattened_kernel_bool_array);

% Create two 3D array and  apply convolution on the input 3D array to the kernel 3D array

% Create a 3D array for the input data and fill with values of 0
input_3D_array = zeros(x_length_input, y_height_input, z_depth_input);


% Now we can take the originally generated flattened input array transpose it and reshape it into the 3D array
% We most grab values 1 - y_height_input and pose that as a column vector and reshape it into the 3D array x_length_input amount of times
% This will give use a slice of the input data across the y dimension
% Mltiply this temporary array by the according to the z depth we are on to the input 3D array
% This will give us the input 3D array filled with the values of the input data
% We then repeat this process z_depth_input amount of times to fill the input 3D array with the values of the input data

% Manually fill each z slice from the flattened array
for i = 1:z_depth_input
    % Reshape as (y, x) so first y_height elements go up Y, then transpose to (x, y)
    temp_2D_array = reshape(flattened_input_array((i-1)*x_length_input*y_height_input + 1:i*x_length_input*y_height_input), y_height_input, x_length_input);
    temp_2D_array = temp_2D_array'; % Transpose to get (x, y)
    
    % For non-random data, scalar is already applied during generation
    % For random data, don't apply any scalar
    input_3D_array(:, :, i) = temp_2D_array;
end

% Create a 3D array for the kernel data and fill with values of 0
kernel_3D_array = zeros(x_length_kernel, y_height_kernel, z_depth_kernel);

% Now we can take the originally generated flattened kernel array transpose it and reshape it into the 3D array
% We most grab values 1 - y_height_kernel and pose that as a column vector and reshape it into the 3D array z_depth_kernel amount of times
% This will give use a slice of the kernel data across the z dimension
% Mltiply this temporary array by the according to the x length we are on to the kernel 3D array
% This will give us the kernel 3D array filled with the values of the kernel data
% We then repeat this process x_length_kernel amount of times to fill the kernel 3D array with the values of the kernel data

% Manually fill each x slice from the flattened array
for i = 1:x_length_kernel
    temp_2D_array = zeros(y_height_kernel, z_depth_kernel); % This is a slice of the kernel data across the z dimension

    temp_2D_array = reshape(flattened_kernel_array((i-1)*y_height_kernel*z_depth_kernel + 1:i*y_height_kernel*z_depth_kernel), y_height_kernel, z_depth_kernel);
    kernel_3D_array(i, :, :) = temp_2D_array * i;
end

% Apply convolution on the input 3D array to the kernel 3D array

% Now we will create an auxillary kernel
% Build this kernel in a more standard way, so values fill othe the Y dimension, then we move accross the X, fill the Y again, across the x until the X is filled then we move across the Z then repeat filling X and Y the across the Z until the Z is filled

% Build the 3D array directly
if auxillary_kernel_data_random == true
    % Fill with random values
    auxillary_kernel_3D_array = randi([1, 10], x_length_kernel, y_height_kernel, z_depth_kernel);
elseif auxillary_kernel_data_random == false
    % Generate linear incremental values
    num_elements = x_length_kernel * y_height_kernel * z_depth_kernel;
    linear_values = (auxillary_kernel_value + (0:num_elements-1) * auxillary_kernel_increment) * auxillary_kernel_scalar;
    
    % Reshape to fill Y first, then X, then Z (column-major order)
    auxillary_kernel_3D_array = reshape(linear_values, y_height_kernel, x_length_kernel, z_depth_kernel);
    
    % Permute to get (x, y, z) indexing
    auxillary_kernel_3D_array = permute(auxillary_kernel_3D_array, [2, 1, 3]);
end


% Now we must slice the auzillary kernel down to a 1 dimmensional array
% It will be converted by going up the Y all the way then across the Z, then the next Y and so on until the Y is filled then the next Z and so on until the Z is filled, then we will go accross the X until the X ect

% Permute to (y, z, x) order so Y is fastest changing dimension
auxillary_kernel_permuted = permute(auxillary_kernel_3D_array, [2, 3, 1]);

% Flatten to 1D array (Y → Z → X order)
flattened_auxillary_kernel_array = auxillary_kernel_permuted(:);

% Now create the timeseries for the auxillary kernel
auxillary_kernel_timeseries = timeseries(flattened_auxillary_kernel_array);
auxillary_kernel_valid_timeseries = timeseries(true(length(flattened_auxillary_kernel_array), 1));


% Make a matching 3D array for the auxillary kernel to the input 3D array
% Use the same data from input_3D_array, extract a subset limited to 5×5 in x and z
% Ensure we only use max 5 in z and x dimensions

% Limit to 5 in x and z dimensions
x_limit = min(x_length_input, 5);
z_limit = min(z_depth_input, 5);

% Extract limited subset from input data
kernel_3D_array_limited = input_3D_array(1:x_limit, :, 1:z_limit);

% Permute to (y, z, x) order so Y is fastest changing dimension
auxillary_kernel_match_input_permuted = permute(kernel_3D_array_limited, [2, 3, 1]);

% Flatten to 1D array (Y → Z → X order)
flattened_auxillary_kernel_match_input_array = auxillary_kernel_match_input_permuted(:);

% Create timeseries
auxillary_kernel_match_input_timeseries = timeseries(flattened_auxillary_kernel_match_input_array);
auxillary_kernel_match_input_valid_timeseries = timeseries(true(length(flattened_auxillary_kernel_match_input_array), 1));



% Ok now that we have all of our input 3D arrays, and kernel lest do some convolution

% We will do a convolution for each kernel indivudually and store the results in a a result 1D/2D array.

% First the auxillary_kernel_match_input_permuted with the input_3D_array. This will give us a 1D/2D array of the results depend on the num_slices value set in the script.

% All we need to do is apply element wise multiplication of the auxillary_kernel_match_input_permuted with the input_3D_array.
% All all of the products together and that will be the result of the convolution.
% There will be no flipping ot padding, we are assuming the kernel is preflipped
% The result will be stored in position x of the result 1D/2D array., then we will move the kernel across the X dimension, recalulate place the result in the correct position in the result 1D/2D array.
% Once we span across the X dimension we will move the kernel across the Z dimension if possible, this will cause the result array to be 2D instead of 1D.

% Calculate valid sliding positions
num_positions_x = x_length_input - x_limit + 1;
num_positions_z = z_depth_input - z_limit + 1;

% Initialize result arrays
convolution_result_full = zeros(num_positions_x, num_positions_z);
convolution_result_sliding = zeros(num_positions_x, num_positions_z);

% Method 1: Full calculation at each position
for z_pos = 1:num_positions_z
    for x_pos = 1:num_positions_x
        % Extract the region from input_3D_array that matches kernel size
        input_region = input_3D_array(x_pos:x_pos+x_limit-1, :, z_pos:z_pos+z_limit-1);
        
        % Element-wise multiplication
        product = input_region .* kernel_3D_array_limited;
        
        % Sum all products to get convolution result at this position
        convolution_result_full(x_pos, z_pos) = sum(product(:));
    end
end

% Method 2: Sliding window optimization using pre-computed slice contributions
% Track individual slice contributions by INPUT X position: (6 x num_positions_x)
% Row 1 = total sum, Rows 2-6 = contribution from INPUT X slices [x_pos, x_pos+1, ..., x_pos+4]
slice_contributions_array = zeros(x_limit + 1, num_positions_x);

for z_pos = 1:num_positions_z
    for x_pos = 1:num_positions_x
        convolution_result_sliding(x_pos, z_pos) = 0;
        
        % For each of the 5 input X slices used at this position
        for i = 1:x_limit
            input_x = x_pos + i - 1; % Which input X slice we're using
            
            % Compute contribution from input[input_x, all Y, all Z] × corresponding kernel parts
            contribution = 0;
            for k_x = 1:x_limit
                for k_z = 1:z_limit
                    % Check if this kernel position aligns with our input_x
                    if x_pos + k_x - 1 == input_x
                        input_z = z_pos + k_z - 1;
                        input_vals = input_3D_array(input_x, :, input_z);
                        kernel_vals = kernel_3D_array_limited(k_x, :, k_z);
                        contribution = contribution + sum(input_vals .* kernel_vals, 'all');
                    end
                end
            end
            
            slice_contributions_array(i + 1, x_pos) = contribution;
            convolution_result_sliding(x_pos, z_pos) = convolution_result_sliding(x_pos, z_pos) + contribution;
        end
        
        % Store the total sum at row 1
        slice_contributions_array(1, x_pos) = convolution_result_sliding(x_pos, z_pos);
    end
end

% Method 3: Using convn (kernel is pre-flipped, so flip it back)
% convn flips the kernel, but our kernel is already pre-flipped, so we need to flip it again
kernel_flipped = flip(flip(flip(kernel_3D_array_limited, 1), 2), 3);
convolution_result_convn = convn(input_3D_array, kernel_flipped, 'valid');

% Verify all methods agree
max_diff_full_sliding = max(abs(convolution_result_full(:) - convolution_result_sliding(:)));
max_diff_full_convn = max(abs(convolution_result_full(:) - convolution_result_convn(:)));
fprintf('Max difference between full and sliding: %e\n', max_diff_full_sliding);
fprintf('Max difference between full and convn: %e\n', max_diff_full_convn);

convolution_result_convn_flatten = convolution_result_convn(:);
% Use this to comapre after running the simmulation
% mismatch = find(out.simout_kernel_values_out ~= convolution_result_convn_flatten);