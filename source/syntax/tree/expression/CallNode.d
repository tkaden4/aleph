module syntax.tree.expression.CallNode;

import syntax.tree.expression.ExpressionNode;
import semantics.type.UnknownType;
import util.match;

public class CallNode : ExpressionNode {
    this(ExpressionNode toCall, ExpressionNode[] args)
    {
        this.call = toCall;
        this.args = args;
        this.type = toCall.resultType.match(
            (FunctionType f) => f.returnType,
            (Type t)         => new UnknownType
        );
    }

    invariant
    {
        assert(this.call !is null, "tocall is null");
    }

    override @property Type resultType()
    {
        return this.type;
    }

    @property void resultType(Type t)
    {
        this.type = t;
    }

    @property auto toCall()
    {
        return this.call;
    }

    @property void toCall(ExpressionNode to)
    {
        this.call = to;
    }

    @property auto arguments()
    {
        return this.args;
    }

    @property void arguments(ExpressionNode[] n)
    {
        this.args = n;
    }

    override string toString() const
    {
        import std.string;
        return "Call(%s, %s, %s)".format(this.call, this.type, this.args);
    }
private:
    Type type;
    ExpressionNode call;
    ExpressionNode[] args;
};