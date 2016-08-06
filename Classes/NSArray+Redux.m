//
//  NSArray+Redux.m
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import "NSArray+Redux.h"

@implementation NSArray (Redux)

- (RxNSArrayMap) map {
    __weak NSArray* warray = self;
    return ^NSArray*(RxNSArrayMapOperator mo) {
        NSMutableArray *results = [NSMutableArray array];
        __strong NSArray *this = warray;
        for(id object in this) {
            [results addObject:mo(object)];
        }
        return [results copy];
    };
}

- (RxNSArrayFilter) filter {
    __weak NSArray* warray = self;
    return ^NSArray*(RxNSArrayFilterOperator fo) {
        __strong NSArray *this = warray;
        NSMutableArray *results = [NSMutableArray array];
        for(id object in this) {
            if(fo(object)) {
                [results addObject:object];
            }
        }
        return [results copy];
    };
}

- (RxNSArrayReduce) reduce {
    __weak NSArray* warray = self;
    return ^id(id initial, RxNSArrayReduceOperator ro) {
        __strong NSArray *array = warray;
        id result = initial;
        for(id object in array) {
            result = ro(result, object);
        }
        return result;
    };
}

- (RxNSArrayFlatmap) flatmap {
    __weak NSArray* warray = self;
    return ^NSArray*(RxNSArrayFlatmapOperator fmo) {
        NSMutableArray *results = [NSMutableArray array];
        __strong NSArray *this = warray;
        for(id object in this) {
            id newArray = fmo(object);
            if(newArray == nil) continue;
            [results addObjectsFromArray:newArray];
        }
        return [results copy];
    };
}

- (RxNSArrayApply) apply {
    __weak NSArray* warray = self;
    return ^NSArray*(NSArray* operators) {
        NSMutableArray *array = [NSMutableArray array];
        for(RxNSArrayMapOperator mo in operators) {
            __strong NSArray *this = warray;
            [array addObjectsFromArray:this.map(mo)];
        }
        return [array copy];
    };
}

- (NSArray*) reverse {
    return self.reverseObjectEnumerator.allObjects;
}

- (NSArray*) flatten {
    NSMutableArray *results = [NSMutableArray array];
    for(id obj in self) {
        if([obj isKindOfClass:[NSArray class]]) {
            [results addObjectsFromArray:((NSArray*)obj).flatten];
        } else {
            [results addObject:obj];
        }
    }
    return [results copy];
}

- (RxNSArrayJoin) join {
    __weak NSArray* warray = self;
    return ^NSString*(NSString *sep) {
        __strong NSArray *this = warray;
        return this.reduce(nil, ^id(NSString *ret, id obj){
            if(ret == nil) {
                return obj;
            } else {
                return [NSString stringWithFormat:@"%@%@%@", ret, sep, obj];
            }
        });
    };
}

- (RxNSArrayForeach) foreach {
    __weak NSArray* warray = self;
    return ^(RxNSArrayForeachOperator foreachOperator) {
        __strong NSArray *this = warray;
        for(NSInteger index = 0; index < this.count; ++index) {
            foreachOperator([this objectAtIndex:index], index);
        }
    };
}

@end
