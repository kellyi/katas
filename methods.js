Array.prototype.partition = function(condition) {
    return this
        .reduce(([t, f], e) => {
            return condition(e) ? [[...t, e], f] : [t, [...f, e]];
        }, [[],[]]);
};
