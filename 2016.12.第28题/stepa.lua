-- params : ...
-- function num : 0 , upvalues : _ENV
ZZBase64 = {}
-- DECOMPILER ERROR at PC70: Confused about usage of register: R0 in 'UnsetPending'

ZZBase64.__code = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "/"}
-- DECOMPILER ERROR at PC73: Confused about usage of register: R0 in 'UnsetPending'

ZZBase64.__decode = {}
for k,v in pairs(ZZBase64.__code) do
  -- DECOMPILER ERROR at PC87: Confused about usage of register: R5 in 'UnsetPending'

  (ZZBase64.__decode)[(string.byte)(v, 1)] = k - 1
end
-- DECOMPILER ERROR at PC92: Confused about usage of register: R0 in 'UnsetPending'

ZZBase64.encode = function(text)
  -- function num : 0_0 , upvalues : _ENV
  local len = (string.len)(text)
  local left = len % 3
  len = len - left
  local res = {}
  local index = 1
  for i = 1, len, 3 do
    local a = (string.byte)(text, i)
    local b = (string.byte)(text, i + 1)
    local c = (string.byte)(text, i + 2)
    local num = a * 65536 + b * 256 + c
    for j = 1, 4 do
      local tmp = (math.floor)(num / 2 ^ ((4 - j) * 6))
      local curPos = tmp % 64 + 1
      res[index] = (ZZBase64.__code)[curPos]
      index = index + 1
    end
  end
  if left == 1 then
    (ZZBase64.__left1)(res, index, text, len)
  else
    if left == 2 then
      (ZZBase64.__left2)(res, index, text, len)
    end
  end
  return (table.concat)(res)
end

-- DECOMPILER ERROR at PC95: Confused about usage of register: R0 in 'UnsetPending'

ZZBase64.__left2 = function(res, index, text, len)
  -- function num : 0_1 , upvalues : _ENV
  local num1 = (string.byte)(text, len + 1)
  num1 = num1 * 1024
  local num2 = (string.byte)(text, len + 2)
  num2 = num2 * 4
  local num = num1 + num2
  local tmp1 = (math.floor)(num / 4096)
  local curPos = tmp1 % 64 + 1
  res[index] = (ZZBase64.__code)[curPos]
  local tmp2 = (math.floor)(num / 64)
  curPos = tmp2 % 64 + 1
  res[index + 1] = (ZZBase64.__code)[curPos]
  curPos = num % 64 + 1
  res[index + 2] = (ZZBase64.__code)[curPos]
  res[index + 3] = "="
end

-- DECOMPILER ERROR at PC98: Confused about usage of register: R0 in 'UnsetPending'

ZZBase64.__left1 = function(res, index, text, len)
  -- function num : 0_2 , upvalues : _ENV
  local num = (string.byte)(text, len + 1)
  num = num * 16
  tmp = (math.floor)(num / 64)
  local curPos = tmp % 64 + 1
  res[index] = (ZZBase64.__code)[curPos]
  curPos = num % 64 + 1
  res[index + 1] = (ZZBase64.__code)[curPos]
  res[index + 2] = "="
  res[index + 3] = "="
end

-- DECOMPILER ERROR at PC101: Confused about usage of register: R0 in 'UnsetPending'

ZZBase64.decode = function(text)
  -- function num : 0_3 , upvalues : _ENV
  local len = (string.len)(text)
  local left = 0
  if (string.sub)(text, len - 1) == "==" then
    left = 2
    len = len - 4
  else
    if (string.sub)(text, len) == "=" then
      left = 1
      len = len - 4
    end
  end
  local res = {}
  local index = 1
  local decode = ZZBase64.__decode
  for i = 1, len, 4 do
    local a = decode[(string.byte)(text, i)]
    local b = decode[(string.byte)(text, i + 1)]
    local c = decode[(string.byte)(text, i + 2)]
    local d = decode[(string.byte)(text, i + 3)]
    local num = a * 262144 + b * 4096 + c * 64 + d
    local e = (string.char)(num % 256)
    num = (math.floor)(num / 256)
    local f = (string.char)(num % 256)
    num = (math.floor)(num / 256)
    res[index] = (string.char)(num % 256)
    res[index + 1] = f
    res[index + 2] = e
    index = index + 3
  end
  if left == 1 then
    (ZZBase64.__decodeLeft1)(res, index, text, len)
  else
    if left == 2 then
      (ZZBase64.__decodeLeft2)(res, index, text, len)
    end
  end
  return (table.concat)(res)
end

-- DECOMPILER ERROR at PC104: Confused about usage of register: R0 in 'UnsetPending'

ZZBase64.__decodeLeft1 = function(res, index, text, len)
  -- function num : 0_4 , upvalues : _ENV
  local decode = ZZBase64.__decode
  local a = decode[(string.byte)(text, len + 1)]
  local b = decode[(string.byte)(text, len + 2)]
  local c = decode[(string.byte)(text, len + 3)]
  local num = a * 4096 + b * 64 + c
  local num1 = (math.floor)(num / 1024) % 256
  local num2 = (math.floor)(num / 4) % 256
  res[index] = (string.char)(num1)
  res[index + 1] = (string.char)(num2)
end

-- DECOMPILER ERROR at PC107: Confused about usage of register: R0 in 'UnsetPending'

ZZBase64.__decodeLeft2 = function(res, index, text, len)
  -- function num : 0_5 , upvalues : _ENV
  local decode = ZZBase64.__decode
  local a = decode[(string.byte)(text, len + 1)]
  local b = decode[(string.byte)(text, len + 2)]
  local num = a * 64 + b
  num = (math.floor)(num / 16)
  res[index] = (string.char)(num)
end

dk = function(k, l)
  -- function num : 0_6 , upvalues : _ENV
  (ZZBase64.decode)(text)
end

t1 = {116, 136, 223, 97, 145, 196, 129, 48, 83, 193, 221, 4, 249, 238, 37, 86, 100, 93, 118, 83, 195, 35, 121, 147, 197, 135, 34, 147, 4, 75, 90, 198, 48, 121, 119, 181, 169, 215, 34, 2, 118, 143, 35, 217, 29, 253, 186, 240, 135, 120, 115, 163, 100, 176, 233, 150, 151, 66, 236, 187, 140, 126, 212, 85, 90, 28, 27, 197, 14, 203, 73, 255, 62, 181, 1, 212, 2, 144, 102, 9, 186, 161, 56, 234, 162, 65, 132, 69, 254, 214, 234, 64, 29, 190, 192, 89, 190, 93, 57, 79, 62, 236, 67, 8, 116, 48, 169, 95, 10, 45, 7, 49, 12, 112, 29, 93, 103, 79, 123, 134, 101, 20, 239, 146, 214, 123, 90, 42, 24, 24, 34, 102, 224, 162, 75, 163, 149, 91, 12, 45, 170, 75, 73, 112, 235, 7, 56, 126, 63, 21, 250, 205, 51, 15, 41, 175, 214, 172, 204, 40, 184, 234, 189, 133, 78, 162, 216, 185, 158, 239, 108, 1, 127, 196, 37, 89, 12, 196, 136, 108, 36, 200, 52, 24, 6, 172, 106, 86, 87, 235, 16, 22, 225, 117, 223, 228, 213, 81, 56, 52, 82, 213, 4, 165, 122, 139, 138, 222, 74, 196, 4, 236, 46, 168, 5, 112, 138, 97, 75, 139, 25, 35, 142, 250, 7, 162, 187, 255, 243, 195, 111, 25, 207, 231, 2, 204, 219, 245, 201, 205, 138, 10, 28, 196, 174, 178, 66, 13, 175, 232, 231, 246, 249, 12, 246, 36, 148, 243, 68, 121, 183, 131, 230, 180, 98, 49, 23, 18, 170, 174, 122, 125, 120, 202, 175, 133, 155, 133, 152, 167, 193, 227, 14, 142, 65, 177, 253, 108, 247, 33, 239, 164, 254, 252, 206, 171, 150, 55, 7, 202, 142, 128, 198, 224, 176, 210, 186, 236, 182, 29, 219, 118, 222, 33, 106, 102, 201, 222, 163, 133, 140, 216, 238, 7, 80, 54, 129, 217, 182, 36, 31, 28, 221, 70, 126, 155, 185, 238, 160, 214, 204, 247, 14, 53, 124, 40, 88, 100, 20, 254, 6, 112, 84, 99, 50, 103, 12, 9, 21, 173, 242, 48, 45, 170, 111, 175, 10, 95, 245, 171, 174, 17, 68, 239, 67, 244, 12, 155, 175, 51, 191, 229, 177, 143, 181, 25, 218, 147, 177, 13, 113, 94, 48, 135, 110, 110, 46, 24, 167, 89, 189, 249, 10, 142, 148, 186, 253, 79, 238, 237, 247, 2, 51, 153, 202, 103, 139, 159, 157, 85, 103, 130, 29, 193, 201, 138, 158, 93, 213, 77, 126, 199, 109, 36, 20, 77, 182, 174, 244, 221, 41, 5, 1, 14, 222, 200, 156, 39, 132, 116, 23, 118, 69, 231, 22, 164, 125, 249, 125, 202, 188, 95, 129, 28, 35, 13, 152, 176, 21, 128, 124, 254, 47, 204, 107, 186, 52, 142, 128, 75, 73, 75, 40, 88, 116, 184, 194, 126, 158, 112, 100, 102, 165, 149, 45, 208, 228, 136, 97, 42, 145, 39, 166, 216, 74, 244, 208, 159, 180, 126, 253, 57, 81, 230, 31, 85, 15, 65, 171, 193, 94, 136, 60, 228, 239, 43, 140, 160, 72, 33, 206, 146, 94, 27, 9, 214, 187, 136, 18, 166, 157, 72, 229, 165, 188, 137, 128, 244, 59, 202, 241, 136, 83, 137, 204, 192, 160, 43, 157, 210, 169, 150, 82, 69, 74, 228, 210, 70, 202, 173, 131, 89, 253, 96, 111, 206, 142, 236, 99, 60, 15, 215, 15, 131, 92, 222, 93, 33, 138, 136, 119, 81, 2, 53, 177, 230, 210, 214, 22, 79, 88, 201, 155, 113, 33, 108, 196, 120, 230, 84, 246, 198, 117, 193, 46, 134, 203, 61, 115, 148, 132, 94, 128, 55, 211, 238, 154, 120, 155, 250, 117, 97, 129, 157, 44, 158, 242, 198, 186, 177, 170, 38, 168, 55, 85, 21, 179, 255, 8, 255, 128, 197, 137, 24, 130, 203, 140, 75, 160, 142, 127, 183, 110, 226, 63, 92, 10, 75, 25, 176, 75, 139, 248, 101, 77, 239, 174, 52, 147, 142, 49, 220, 238, 58, 125, 15, 171, 16, 230, 188, 226, 10, 64, 89, 159, 237, 54, 3, 186, 63, 54, 170, 232, 119, 212, 53, 17, 91, 237, 81, 93, 160, 168, 89, 82, 244, 194, 100, 4, 53, 221, 172, 118, 98, 116, 182, 27, 30, 98, 76, 120, 126, 139, 12, 102, 145, 11, 71, 219, 131, 147, 27, 137, 216, 107, 179, 29, 86, 145, 178, 125, 204, 183, 237, 218, 117, 109, 48, 236, 223, 36, 250, 74, 225, 66, 129, 0, 56, 67, 202, 61, 138, 178, 15, 117, 2, 231, 108, 18, 139, 100, 122, 35, 142, 54, 61, 117, 230, 57, 86, 20, 227, 35, 62, 38, 137, 99, 249, 113, 123, 185, 166, 222, 246, 155, 58, 63, 137, 229, 35, 10, 137, 108, 255, 7, 161, 177, 84, 79, 47, 71, 2, 25, 40, 101, 83, 221, 61, 128, 36, 153, 74, 139, 15, 81, 48, 222, 233, 56, 21, 135, 121, 176, 106, 106, 225, 17, 22, 50, 21, 50, 254, 246, 106, 198, 5, 39, 252, 150, 74, 202, 251, 181, 193, 189, 91, 87, 62, 71, 218, 115, 200, 21, 236, 42, 161, 161, 3, 150, 161, 73, 54, 247, 180, 110, 134, 228, 108, 106, 25, 22, 80, 10, 178, 72, 44, 2, 77, 116, 49, 104, 169, 179, 40, 132, 242, 7, 181, 70, 100, 100, 237, 211, 248, 64, 4, 21, 247, 1, 176, 38, 220, 241, 236, 24, 123, 116, 182, 118, 86, 144, 71, 58, 27, 19, 176, 161, 182, 60, 146, 179, 156, 115, 165, 124, 248, 21, 62, 69, 250, 192, 220, 136, 160, 244, 156, 75, 61, 179, 89, 88, 67, 131, 146, 255, 119, 73, 108, 43, 186, 124, 66, 71, 33, 182, 92, 248, 90, 171, 207, 207, 34, 70, 113, 240, 176, 145, 21, 73, 110, 119, 123, 218, 103, 134, 160, 45, 18, 107, 197, 214, 119, 87, 92, 130, 84, 93, 210, 138, 10, 81, 136, 63, 94, 69, 137, 162, 199, 221, 251, 37, 183, 201, 89, 160, 63, 106, 214, 206, 245, 225, 121, 91, 160, 192, 32, 136, 88, 178, 213, 153, 168, 158, 229, 231, 247, 81, 75, 74, 215, 170, 98, 144, 97, 62, 3, 80, 94, 192, 41, 134, 94, 94, 24, 98, 105, 124, 90, 239, 151, 74, 152, 87, 143, 222, 200, 27, 97, 189, 18, 137, 161, 137, 150, 92, 93, 103, 33, 174, 182, 127, 148, 207, 67, 177, 114, 148, 2, 116, 109, 172, 154, 194, 189, 69, 46, 191, 154, 169, 214, 39, 34, 60, 172, 149, 237, 33, 180, 203, 244, 74, 207, 35, 77, 249, 33, 165, 171, 9, 55, 187, 86, 208, 180, 43, 153, 62, 63, 212, 241, 6, 200, 82, 1, 250, 71, 187, 159, 45, 104, 188, 27, 56, 188, 204, 218, 113, 212, 114, 205, 165, 173, 236, 113, 38, 91, 225, 33, 189, 13, 113, 242, 160, 30, 60, 161, 100, 211, 3, 164, 113, 141, 166, 210, 72, 240, 175, 175, 61, 255, 63, 112, 90, 188, 212, 146, 177, 97, 212, 26, 121, 170, 94, 198, 236, 172, 137, 182, 75, 206, 84, 52, 254, 123, 228, 224, 142, 22, 27, 79, 72, 206, 106, 214, 118, 18, 255, 61, 87, 251, 159, 174, 84, 103, 238, 163, 114, 26, 49, 199, 97, 173, 157, 52, 7, 63, 138, 103, 28, 49, 235, 220, 54, 85, 73, 19, 152, 244, 118, 159, 92, 139, 0, 73, 84, 112, 106, 0, 3, 225, 166, 125, 187, 87, 199, 170, 181, 4, 91, 22, 227, 172, 23, 75, 163, 233, 37, 111, 217, 240, 122, 225, 197, 225, 124, 66, 87, 167, 28, 186, 207, 131, 46, 146, 164, 7, 178, 70, 153, 30, 70, 149, 137, 227, 90, 184, 35, 174, 221, 89, 8, 71, 155, 196, 151, 203, 172, 15, 239, 221, 173, 71, 230, 102, 68, 51, 188, 22, 76, 142, 59, 72, 103, 135, 14, 110, 116, 176, 78, 202, 247, 234, 122, 98, 82, 101, 110, 86, 169, 95, 1, 161, 200, 240, 6, 167, 202, 34, 241, 97, 113, 26, 93, 61, 246, 79, 133, 35, 168, 70, 152, 223, 198, 172, 247, 244, 61, 186, 119, 126, 81, 120, 94, 64, 24, 22, 55, 3, 244, 247, 183, 158, 173, 99, 249, 91, 135, 243, 237, 233, 4, 175, 126, 11, 191, 183, 239, 123, 195, 39, 49, 92, 152, 131, 74, 200, 94, 61, 30, 168, 203, 242, 46, 247, 21, 171, 183, 107, 34, 167, 171, 155, 50, 61, 44, 54, 175, 186, 66, 30, 173, 162, 119, 28, 26, 109, 202, 109, 149, 203, 70, 26, 70, 80, 213, 92, 243, 24, 31, 69, 208, 14, 71, 157, 7, 6, 142, 29, 154, 145, 21, 52, 151, 4, 168, 86, 38, 91, 220, 30, 97, 28, 193, 48, 74, 184, 131, 238, 20, 217, 48, 68, 173, 218, 103, 57, 50, 157, 77, 237, 193, 128, 43, 140, 252, 64, 115, 148, 155, 31, 0, 8, 117, 74, 118, 237, 231, 195, 69, 144, 124, 17, 236, 141, 195, 161, 183, 120, 153, 37, 75, 51, 134, 18, 3, 102, 142, 231, 112, 64, 190, 21, 174, 52, 46, 189, 1, 201, 125, 76, 72, 135, 83, 245, 175, 128, 95, 227, 38, 66, 27, 172, 107, 180, 79, 200, 204, 222, 125, 96, 189, 187, 38, 17, 16, 162, 229, 189, 114, 148, 55, 124, 220, 42, 142, 131, 131, 116, 165, 121, 133, 40, 94, 222, 200, 83, 10, 65, 43, 52, 221, 195, 244, 148, 111, 157, 135, 236, 23, 143, 168, 105, 93, 93, 42, 225, 248, 137, 156, 37, 254, 122, 208, 24, 159, 168, 14, 209, 27, 229, 83, 103, 250, 52, 165, 50, 209, 15, 71, 242, 111, 63, 186, 45, 33, 183, 146, 75, 96, 27, 170, 183, 22, 164, 92, 122, 122, 115, 70, 141, 45, 141, 205, 78, 111, 59, 232, 16, 171, 242, 78, 78, 123, 191, 191, 219, 252, 152, 182, 47, 74, 233, 108, 75, 228, 11, 107, 89, 226, 72, 244, 3, 184, 235, 45, 98, 110, 62, 174, 26, 131, 21, 164, 65, 14, 147, 19, 165, 16, 42, 197, 231, 21, 42, 36, 10, 51, 83, 178, 55, 237, 61, 181, 73, 101, 227, 162, 150, 231, 16, 176, 86, 49, 39, 158, 201, 57, 158, 33, 42, 238, 232, 29, 139, 147, 22, 99, 172, 90, 79, 83, 164, 173, 63, 107, 221, 49, 8, 15, 254, 8, 40, 226, 147, 191, 83, 37, 114, 64, 211, 167, 25, 25, 44, 168, 39, 180, 53, 97, 249, 56, 196, 38, 18, 234, 176, 62, 69, 212, 252, 178, 102, 31, 245, 29, 183, 193, 211, 230, 22, 135, 234, 105, 197, 227, 121, 133, 64, 172, 172, 161, 147, 231, 82, 109, 29, 211, 10, 197, 125, 207, 242, 245, 57, 135, 195, 220, 134, 201, 149, 192, 91, 227, 207, 231, 136, 193, 31, 106, 90, 202, 145, 39, 219, 174, 214, 198, 56, 151, 5, 53, 178, 32, 107, 131, 178, 242, 25, 85, 242, 74, 227, 36, 130, 147, 250, 165, 49, 172, 172, 248, 55, 175, 47, 23, 173, 209, 74, 198, 136, 189, 167, 22, 157, 135, 191, 60, 147, 80, 37, 78, 29, 186, 88, 15, 86, 246, 237, 16, 195, 80, 179, 2, 222, 226, 34, 69, 205, 40, 23, 25, 99, 112, 118, 122, 70, 50, 146, 66, 13, 91, 5, 29, 228, 211, 236, 101, 150, 190, 28, 202, 238, 58, 70, 233, 145, 203, 149, 4, 5, 64, 248, 200, 248, 33, 234, 200, 13, 6, 150, 85, 200, 117, 181, 29, 109, 0, 126, 41, 65, 87, 80, 68, 183, 156, 109, 173, 74, 96, 161, 155, 89, 105, 249, 18, 141, 148, 136, 97, 66, 233, 24, 118, 157, 21, 89, 118, 118, 206, 2, 134, 128, 103, 193, 220, 50, 233, 135, 146, 214, 254, 112, 30, 20, 236, 245, 120, 19, 208, 163, 90, 51, 68, 34, 6, 48, 18, 51, 127, 211, 50, 18, 255, 251, 129, 86, 193, 143, 161, 153, 209, 43, 120, 220, 155, 30, 234, 48, 186, 158, 115, 47, 96, 3, 150, 50, 248, 181, 159, 25, 20, 212, 77, 33, 148, 99, 88, 114, 174, 148, 116, 75, 227, 115, 210, 22, 20, 87, 238, 198, 236, 66, 133, 120, 61, 136, 136, 225, 45, 26, 155, 13, 62, 249, 27, 223, 66, 216, 195, 131, 175, 168, 10, 193, 167, 147, 249, 223, 74, 186, 53, 218, 157, 180, 41, 149, 177, 82, 123, 16, 249, 139, 207, 148, 236, 100, 250, 150, 223, 177, 136, 219, 255, 215, 69, 170, 255, 209, 15, 13, 244, 193, 150, 78, 31, 78, 254, 166, 131, 108, 232, 89, 89, 239, 3, 89, 214, 220, 131, 70, 32, 176, 204, 18, 187, 167, 186, 132, 186, 196, 127, 52, 153, 168, 69, 192, 190, 197, 113, 44, 208, 75, 164, 68, 44, 214, 117, 15, 36, 214, 214, 101, 71, 87, 244, 95, 59, 170, 129, 9, 5, 136, 58, 78, 187, 97, 135, 12, 187, 73, 142, 231, 93, 255, 140, 96, 193, 110, 242, 97, 23, 130, 146, 0, 70, 140, 3, 212, 105, 23, 228, 158, 105, 214, 36, 255, 252, 52, 20, 245, 18, 51, 109, 209, 132, 99, 216, 96, 150, 142, 184, 208, 225, 251, 8, 172, 130, 74, 226, 99, 105, 180, 87, 17, 223, 164, 106, 213, 24, 176, 160, 29, 217, 135, 66, 106, 52, 200, 54, 117, 239, 127, 136, 30, 167, 125, 41, 20, 84, 24, 89, 147, 100, 165, 85, 136, 61, 247, 142, 172, 114, 19, 129, 227, 72, 91, 82, 41, 35, 58, 75, 70, 220, 44, 242, 71, 1, 74, 136, 123, 189, 205, 142, 66, 104, 125, 30, 209, 136, 132, 212, 222, 82, 28, 119, 140, 102, 240, 134, 113, 205, 30, 71, 46, 75, 174, 26, 142, 118, 94, 9, 145, 19, 75, 30, 174, 246, 194, 0, 155, 227, 97, 107, 14, 206, 50, 141, 58, 147, 15, 246, 51, 199, 105, 52, 86, 210, 44, 97, 3, 197, 100, 198, 206, 194, 100, 38, 100, 134, 83, 52, 243, 68, 247, 218, 38, 165, 109, 109, 225, 190, 83, 5, 177, 19, 87, 162, 25, 238, 217, 90, 88, 229, 201, 180, 1, 158, 173, 221, 125, 175, 91, 124, 171, 48, 22, 246, 138, 199, 245, 47, 190, 198, 228, 80, 251, 245, 28, 185, 31, 71, 240, 216, 150, 11, 159, 18, 64, 18, 116, 2, 249, 23, 4, 211, 129, 19, 150, 99, 100, 98, 216, 77, 219, 239, 9, 16, 252, 61, 180, 75, 135, 95, 153, 74, 18, 201, 75, 237, 238, 90, 51, 121, 122, 105, 159, 34, 9, 123, 23, 206, 38, 78, 124, 47, 84, 166, 12, 35, 4, 3, 16, 189, 28, 236, 210, 16, 77, 52, 39, 26, 196, 204, 35, 190, 182, 161, 66, 137, 177, 38, 252, 184, 248, 36, 25, 224, 61, 47, 255, 226, 91, 230, 142, 99, 183, 9, 219, 35, 10, 182, 117, 215, 108, 1, 34, 74, 78, 227, 125, 59, 124, 233, 145, 50, 46, 77, 93, 228, 0, 152, 138, 29, 207, 30, 48, 163, 107, 91, 239, 130, 83, 166, 118, 59, 13, 56, 177, 146, 205, 180, 255, 241, 189, 61, 76, 15, 254, 222, 245, 82, 242, 137, 236, 185, 46, 205, 53, 211, 143, 57, 211, 29, 217, 14, 186, 26, 130, 194, 27, 20, 218, 129, 224, 247, 134, 219, 27, 31, 23, 0, 138, 186, 173, 210, 110, 154, 226, 198, 133, 253, 34, 240, 61, 232, 104, 129, 68, 25, 6, 56, 221, 198, 222, 84, 92, 186, 174, 197, 106, 173, 208, 247, 141, 211, 57, 231, 58, 89, 8, 163, 106, 212, 251, 46, 252, 79, 165, 5, 159, 118, 247, 169, 56, 116, 156, 236, 176, 25, 230, 113, 151, 216, 50, 182, 17, 164, 201, 179, 115, 45, 179, 131, 93, 198, 158, 168, 66, 128, 244, 28, 103, 240, 98, 249, 55, 9, 20, 214, 40, 150, 108, 45, 132, 153, 19, 245, 163, 247, 117, 176, 169, 100, 127, 76, 149, 145, 148, 162, 45, 140, 187, 106, 115, 106, 112, 1, 225, 93, 75, 44, 51, 234, 235, 148, 90, 61, 148, 138, 140, 190, 36, 230, 129, 1, 215, 178, 122, 93, 28, 32, 135, 120, 58, 102, 211, 222, 128, 213, 90, 203, 217, 211, 69, 101, 214, 81, 160, 219, 198, 234, 210, 92, 234, 239, 56, 215, 36, 132, 110, 146, 226, 113, 107, 66, 129, 92, 161, 150, 125, 144, 156, 144, 88, 230, 62, 165, 131, 87, 226, 32, 46, 160, 88, 97, 9, 49, 87, 58, 31, 187, 22, 221, 228, 115, 176, 12, 110, 160, 254, 186, 133, 248, 120, 254, 211, 7, 152, 234, 57, 86, 188, 253, 88, 194, 88, 30, 22, 120, 127, 30, 158, 207, 109, 172, 178, 108, 71, 90, 234, 28, 154, 86, 84, 103, 118, 200, 104, 141, 169, 150, 241, 65, 181, 11, 81, 244, 188, 21, 52, 68, 70, 146, 131, 55, 187, 146, 17, 55, 57, 6, 237, 131, 226, 193, 66, 30, 254, 53, 216, 28, 30, 216, 186, 118, 181, 230, 10, 46, 182, 119, 99, 68, 208, 222, 10, 46, 83, 81, 112, 31, 19, 234, 184, 104, 242, 108, 228, 75, 32, 24, 178, 46, 202, 136, 214, 152, 141, 93, 64, 175, 195, 28, 18, 105, 227, 250, 198, 96, 170, 116}
_ENV.cp = (ZZBase64.decode)(L)
if ((_ENV.string).len)(_ENV.cp) ~= 46 then
  _ENV.g_v1 = nil
end
if (_ENV.cp)[1] ~= "." then
  _ENV.g_v1 = nil
else
  if (_ENV.cp)[2] ~= "t" then
    _ENV.g_v1 = nil
  else
    if (_ENV.cp)[3] ~= "r" then
      _ENV.g_v1 = nil
    else
      if (_ENV.cp)[4] ~= "y" then
        _ENV.g_v1 = nil
      else
        if (_ENV.cp)[5] ~= "2" then
          _ENV.g_v1 = nil
        else
          if (_ENV.cp)[6] ~= "c" then
            _ENV.g_v1 = nil
          else
            if (_ENV.cp)[7] ~= "r" then
              _ENV.g_v1 = nil
            else
              if (_ENV.cp)[8] ~= "a" then
                _ENV.g_v1 = nil
              else
                if (_ENV.cp)[9] ~= "c" then
                  _ENV.g_v1 = nil
                else
                  if (_ENV.cp)[10] ~= "k" then
                    _ENV.g_v1 = nil
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
_ENV.sk = ((_ENV.string).sub)(_ENV.cp, 2, 10)
_ENV.g_v1 = ((_ENV.string).sub)(_ENV.cp, 11)
if _ENV.g_v1 ~= 0 then
  return t1
else
  return nil
end


