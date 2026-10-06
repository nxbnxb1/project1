function c = dart_cross3(a, b) %#codegen
%DART_CROSS3 Cross product of two 3-vectors (fast, codegen friendly).
c = [a(2) * b(3) - a(3) * b(2);
     a(3) * b(1) - a(1) * b(3);
     a(1) * b(2) - a(2) * b(1)];
end
