
module DelimCC
    def metacc_get
        tmp = Thread.current["__meta_cc__"]
        if !tmp
            proc { raise "not within a reset statement" }
        else
            tmp
        end
    end

    def metacc_set(&meta_cont)
        Thread.current["__meta_cc__"] = meta_cont
    end


    def abortcc(&blk)
        value = blk.call
        metacc_get.call value
    end

    def reset(&blk)
        callcc do |cont|
            meta_cont = metacc_get
            metacc_set {|value|
                metacc_set &meta_cont
                cont.call value
            }
            abortcc &blk
        end
    end

    def shift(&blk)
        callcc do |cont|
            abortcc do
                blk.call proc {|value|
                    reset { cont.call value }
                }
            end
        end
    end

end

