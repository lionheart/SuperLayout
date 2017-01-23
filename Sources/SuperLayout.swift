//
//  SuperLayout.swift
//  Pods
//
//  Created by Daniel Loewenherz on 1/13/17.
//
//

import UIKit

precedencegroup ConstraintPrecedence {
    lowerThan: AdditionPrecedence
    higherThan: AssignmentPrecedence
    associativity: left
    assignment: false
}

infix operator ~~: ConstraintPrecedence
infix operator ≥≥: ConstraintPrecedence
infix operator ≤≤: ConstraintPrecedence

public protocol Anchoring {
    associatedtype T

    var multiplier: CGFloat { get }
    var constant: CGFloat { get }
    var anchor: T { get }
}

public protocol AxisAnchoring: Anchoring {
    func constraint(equalTo: T, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo: T, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo: T, constant: CGFloat) -> NSLayoutConstraint
}

public protocol DimensionAnchoring: Anchoring {
    func constraint(equalToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualToConstant: CGFloat) -> NSLayoutConstraint

    func constraint(equalTo: T, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
    func constraint(lessThanOrEqualTo: T, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
    func constraint(greaterThanOrEqualTo: T, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint
}

public struct LayoutContainer<U>: Anchoring {
    public typealias T = U

    public var multiplier: CGFloat
    public var constant: CGFloat
    public var anchor: T

    init<U: Anchoring>(anchor: U, constant: CGFloat) where U.T == T {
        self.constant = constant
        self.multiplier = anchor.multiplier
        self.anchor = anchor.anchor
    }

    init<U: DimensionAnchoring>(anchor: U, multiplier: CGFloat) where U.T == T {
        self.constant = anchor.constant
        self.multiplier = multiplier
        self.anchor = anchor.anchor
    }

    static func +(lhs: LayoutContainer<U>, rhs: CGFloat) -> LayoutContainer {
        return LayoutContainer(anchor: lhs, constant: rhs)
    }

    static func -(lhs: LayoutContainer<U>, rhs: CGFloat) -> LayoutContainer {
        return LayoutContainer(anchor: lhs, constant: -rhs)
    }
}

extension NSLayoutYAxisAnchor: AxisAnchoring {
    public typealias T = NSLayoutAnchor<NSLayoutYAxisAnchor>

    public var multiplier: CGFloat { return 1 }
    public var constant: CGFloat { return 0 }
    public var anchor: T { return self }
}

extension NSLayoutXAxisAnchor: AxisAnchoring {
    public typealias T = NSLayoutAnchor<NSLayoutXAxisAnchor>

    public var multiplier: CGFloat { return 1 }
    public var constant: CGFloat { return 0 }
    public var anchor: T { return self }
}

extension NSLayoutDimension: DimensionAnchoring {
    public typealias T = NSLayoutDimension

    public var multiplier: CGFloat { return 1 }
    public var constant: CGFloat { return 0 }
    public var anchor: T { return self }
}

public extension DimensionAnchoring {
    @discardableResult
    static func ~~<U: Anchoring>(lhs: Self, rhs: U) -> NSLayoutConstraint where U.T == T {
        let constraint = lhs.constraint(equalTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    static func ≤≤<U: Anchoring>(lhs: Self, rhs: U) -> NSLayoutConstraint where U.T == T {
        let constraint = lhs.constraint(lessThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    static func ≥≥<U: Anchoring>(lhs: Self, rhs: U) -> NSLayoutConstraint where U.T == T {
        let constraint = lhs.constraint(greaterThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplier, constant: rhs.constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    static func ~~(lhs: Self, rhs: CGFloat) -> NSLayoutConstraint {
        let constraint = lhs.constraint(equalToConstant: rhs)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    static func ≤≤(lhs: Self, rhs: CGFloat) -> NSLayoutConstraint {
        let constraint = lhs.constraint(lessThanOrEqualToConstant: rhs)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    static func ≥≥(lhs: Self, rhs: CGFloat) -> NSLayoutConstraint {
        let constraint = lhs.constraint(greaterThanOrEqualToConstant: rhs)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    static func *(lhs: Self, rhs: CGFloat) -> LayoutContainer<Self.T> {
        return LayoutContainer(anchor: lhs, multiplier: rhs)
    }
}

public extension AxisAnchoring {
    @discardableResult
    static func ~~<U: Anchoring>(lhs: Self, rhs: U) -> NSLayoutConstraint where U.T == T {
        let constraint = lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    static func ≤≤<U: Anchoring>(lhs: Self, rhs: U) -> NSLayoutConstraint where U.T == T {
        let constraint = lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
        constraint.isActive = true
        return constraint
    }

    @discardableResult
    static func ≥≥<U: Anchoring>(lhs: Self, rhs: U) -> NSLayoutConstraint where U.T == T {
        let constraint = lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
        constraint.isActive = true
        return constraint
    }

    static func +(lhs: Self, rhs: CGFloat) -> LayoutContainer<T> {
        return LayoutContainer(anchor: lhs, constant: rhs)
    }

    static func -(lhs: Self, rhs: CGFloat) -> LayoutContainer<T> {
        return LayoutContainer(anchor: lhs, constant: -rhs)
    }
}
