Array.prototype.partition = function(condition) {
    return this
        .reduce(([t, f], e) => {
            return condition(e) ? [[...t, e], f] : [t, [...f, e]];
        }, [[],[]]);
};

Array.prototype.chunk = function(count) {
    return this
        .reduce(([h, ...rest], e) => {
            return h.length === count ? [[e], h, ...rest] : [[e, ...h], ...rest];
        }, [[]])
        .map(e => e.reverse())
        .reverse();
};

Array.prototype.compact = function() {
    return this.filter(e => e);
};

Array.prototype.fromPairs = function() {
    return this.reduce((acc, [k, v]) =>
        Object.assign({}, acc, {
            [k]: v,
        }), {});
}
