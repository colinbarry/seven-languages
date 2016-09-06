-- Implement a monad in a nonfunctional language.

--[[
- Monad axioms:
- unit and bind roughly perform inverse operations: unit puts a value into a monadic state; bind
- removes it to apply a function. Both return a monadic state.
-   bind(unit(x), f) == f(x)
-   bind(m, unit) == m

- Binding two functions in succession is the same as binding one composite function:
-   bind(bind(m, f), g) == bind(m, function(v) bind(f(v), g) end)

]]--

function unit(value)
    return {value}
end

function bind(x, f)
    results = {}
    for _, v in ipairs(x) do
        local y = f(v)
        for _, v in ipairs(y) do
            results[#results + 1] = v
        end
    end
    
    return results
end

function csqrt(x)
    if x == 0.0 then return {0}
    elseif x > 0.0 then return { -math.sqrt(x), math.sqrt(x) }
    else return {} end
end

function printtable(t)
    for i, v in ipairs(t) do
        if i ~= 1 then io.write ", " end
        io.write(v)
    end
    io.write('\n')
end

local r = bind(bind(unit(100), csqrt), csqrt)

printtable (r)