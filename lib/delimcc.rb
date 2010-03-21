
module DelimCC
    def metacc_get
        tmp = Thread.current["__meta_cc__"]
        if !tmp
            proc { raise "not within a reset statement" }
        else
            tmp
        end
    end

    def metacc_set(&m)
        Thread.current["__meta_cc__"] = m
    end


    def abortcc(&blk)
        v = blk.call
        metacc_get.call v
    end

    def reset(&blk)
        callcc do |k|
            m = metacc_get
            metacc_set {|r|
                metacc_set &m
                k.call r
            }
            abortcc &blk
        end
    end

    def shift(&blk)
        callcc do |k|
            abortcc do
                blk.call proc {|x|
                    reset { k.call x }
                }
            end
        end
    end

end

