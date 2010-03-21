
require 'rubygems'

require 'delimcc'
include DelimCC

p 'test 1'
tmp = reset { 2 * shift { |k| k.call(k.call(k.call 4)) }} + 1
p tmp # 33

p 'test 2'
reset do
    p 1
end 
# => 1

p 'test 3'
reset do
    p 1
    shift {}
    p 2
end
# => 1

p 'test 4'
reset do
    p 1
    shift {
        p 2
    }
    p 3
end
# => 1, 2

p 'test 5'
reset do
    p 1
    shift { |k|
        k.call nil
        p 2
    }
    p 3
end
# => 1, 3, 2

p 'test 6'
reset do
    p 1
    shift { |k|
        k.call nil
        k.call nil
        p 2
    }
    p 3
end
# => 1, 3, 3, 2
