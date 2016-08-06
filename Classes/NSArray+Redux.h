//
//  NSArray+Redux.h
//  Redux
//
//  Created by lzhu on 8/5/16.
//  Copyright © 2016 redeight. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^RxNSArrayMapOperator)(id object);
typedef NSArray* (^RxNSArrayMap)(RxNSArrayMapOperator mapOperator);

typedef BOOL (^RxNSArrayFilterOperator)(id object);
typedef NSArray* (^RxNSArrayFilter)(RxNSArrayFilterOperator filterOperator);

typedef id (^RxNSArrayReduceOperator)(id result, id object);
typedef id (^RxNSArrayReduce) (id initialValue, RxNSArrayReduceOperator reduceOperator);

typedef NSString*(^RxNSArrayJoin)(NSString *sep);

typedef void (^RxNSArrayForeachOperator)(id object, NSInteger index);
typedef void (^RxNSArrayForeach)(RxNSArrayForeachOperator foreachOperator);

typedef NSArray* (^RxNSArrayFlatmapOperator)(id object);
typedef NSArray* (^RxNSArrayFlatmap) (RxNSArrayFlatmapOperator reduceOperator);


typedef NSArray* (^RxNSArrayApply) (NSArray<RxNSArrayMapOperator> *mapOperators);



@interface NSArray (Redux)

/**
 * Functor
 */
@property (readonly) RxNSArrayMap map;

/**
 * Monad
 */
@property (readonly) RxNSArrayFlatmap flatmap;

/**
 * Applicative
 */
@property (readonly) RxNSArrayApply apply;

@property (readonly) RxNSArrayFilter filter;

@property (readonly) NSArray* reverse;

@property (readonly) NSArray* flatten;

@property (readonly) RxNSArrayReduce reduce;

@property (readonly) RxNSArrayJoin join;

@property (readonly) RxNSArrayForeach foreach;

@end

