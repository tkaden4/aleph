module semantics.type.TypeofType;

import semantics.type.Type;
import syntax.tree.expression.Expression;

public class TypeofType : Type {
    this(Expression node)
    {
        this.node = node;
    }

    invariant
    {
        assert(this.node);
    }

    override bool canCast(Type type)
    in {
        assert(type);
    } body {
        return type.canCast(this.node.resultType);
    }

    override string toString() const
    {
        import std.string;
        return "TypeofType(%s)".format(this.node.resultType);
    }

    bool isResolved()
    {
        import util.match;
        return this.getType.match(
            (UnknownType _) => false,
            (TypeofType _) => false,
            (Type _) => true
        );
    }

    @property Type getType()
    {
        return node.resultType;
    }

    Expression node;
};
