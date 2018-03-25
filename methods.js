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
};

Array.prototype.flatten = function() {
    return this
        .reduce((acc, next) =>
            acc.concat(Array.isArray(next) ? next.flatten() : next), []);
}

Array.prototype.flatMap = function(fn) {
    return this
        .reduce((acc, next) =>
            acc.concat(Array.isArray(next) ? next.flatMap(fn) : fn(next)), []);
}

String.prototype.camelCase = function() {
    return this
        .split(/[^a-zA-Z]/g)
        .compact()
        .map(e => e.toLowerCase())
        .reduce((acc, [h, ...rest]) => {
            return !acc ?
                `${h}${rest.join('')}` :
                `${acc}${h.toUpperCase()}${rest.join('')}`;
        }, '');
};

String.prototype.kebabCase = function() {
    return this
        .split(/[^a-zA-Z]/g)
        .compact()
        .map(e => e.toLowerCase())
        .join('-')
};
