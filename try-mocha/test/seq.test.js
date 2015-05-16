// 测试: 调用测试样例的顺序（按照describe的顺序执行）
var assert = require("assert")

describe('Array', function() {
    describe('#test1', function() {
        console.log('test1')
    })

    describe('#test2', function() {
        console.log('test2')
    })

    describe('#test3', function() {
        console.log('test3')
    })

})