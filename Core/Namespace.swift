//
//  Namespace.swift
//  HandOfTheKing
//
//  Created by Carl on 22/3/2017.
//  Copyright © 2017 nswebfrog. All rights reserved.
//

// 创建一个通用的协议
public protocol NamespaceWrappable {
    // 表示占位的数据，预先定义一个名字，具体的标识类型需要用到的时候再进行赋值
    associatedtype HandWrapperType
    // 协议继承者会拥有一个 HandWrapperType类型的值属性，该属性为只读
    var hand: HandWrapperType { get } 
    // 持有的类型属性，只读
    static var hand: HandWrapperType.Type { get }
}

// 协议的默认实现：实现协议的子类就不需要自行实现协议约定的内容了
public extension NamespaceWrappable {
    // 继承该协议，将自动将自己传入命名空间包装结构体
    var hand: NamespaceWrapper<Self> {
        return NamespaceWrapper(value: self)
    }

    // 类型属性值读取
    static var hand: NamespaceWrapper<Self>.Type {
        return NamespaceWrapper.self
    }
}

// 公开的结构体，用来持有被包装的对象
public struct NamespaceWrapper<T> {
    public let wrappedValue: T
    public init(value: T) {
        self.wrappedValue = value
    }
}
