module syntax.tree.ExternProcNode;

import syntax.builders.routine;
import semantics.type;

import syntax.tree.StatementNode;

import util;
import std.string;

public class ExternProcNode : StatementNode {

    this(string name, Type type, Type[] params, bool isvararg=false)
    {
        this.name = name;
        this.returnType = type;
        this.parameterTypes = params;
        this.isvararg = isvararg;
    }

    auto functionType()
    {
        return this.returnType.use!(k => new FunctionType(k, this.parameterTypes));
    }

    override string toString() const
    {
        return "ExternProc(%s, ret: %s, params: %s, vararg: )".format(this.name,
                                                            this.returnType,
                                                            this.parameterTypes,
                                                            this.isvararg);
    }

    bool isvararg;
    string name;
    Type returnType;
    Type[] parameterTypes;
};