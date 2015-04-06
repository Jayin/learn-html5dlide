async = require 'async'

# Paralle 并行执行
    
test_parallel1 = ()->

    async.parallel [
             (cb)->
                console.log '1'
                cb(null,'1 is done')
            ,(cb)->
                console.log '2'
                cb(null,'2 is done')
            ,(cb)->
                console.log '3'
                cb(null,'3 is done')
            ,(cb)->
                console.log '4'
                cb(null,'4 is done')
        ],(err, results)->
            console.log '---------'
            console.log "callback"
            if err 
                console.log err
            console.log results
            results.forEach (item,index)->
                console.log item
                console.log index


test_parallel2 = ()->
    # 所有的task均同时跑,遇到错误就不执行后面的的了
    async.parallel [
             (cb)->
                console.log '1'
                cb(null,'1 is done')
            ,(cb)->
                console.log '2'
                cb(new Error('LOL,,,'),'2 is done')  ## test Error
            ,(cb)->
                console.log '3'
                cb(null,'3 is done')
            ,(cb)->
                console.log '4'
                cb(null,'4 is done')
        ],(err, results)->  # 最后的回调
            console.log '---------'
            console.log "callback"
            if err
                console.log err
            console.log results
            results.forEach (item,index)->
                console.log item
                console.log index


# Series 顺序执行
test_series1 = ()->

    async.series [
             (cb)->
                console.log '1'
                cb(null,'1 is done')
            ,(cb)->
                console.log '2'
                cb(null,'2 is done')
            ,(cb)->
                console.log '3'
                cb(null,'3 is done')
            ,(cb)->
                console.log '4'
                cb(null,'4 is done')
        ],(err, results)->
                console.log '---------'
                console.log "callback"
                if err 
                    console.log err
                console.log results
                results.forEach (index,item)->
                    console.log item, index


test_series2 = ()->

    async.series [
             (cb)->
                console.log '1'
                cb(null,'1 is done')
            ,(cb)->
                console.log '2'
                cb(new Error('LOL,,,'),'2 is done')  ## test Error
            ,(cb)->
                console.log '3'
                cb(null,'3 is done')
            ,(cb)->
                console.log '4'
                cb(null,'4 is done')
        ],(err, results)->
                console.log '---------'
                console.log "callback"
                if err 
                    console.log err
                console.log results
                results.forEach (index,item)->
                    console.log item, index





test_parallel1()
console.log '*********'

test_parallel2()
console.log '*********'

test_series1()

console.log '*********'
test_series2()






