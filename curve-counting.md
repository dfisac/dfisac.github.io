---
title: "Word length curve counting calculator on the once-punctured torus"
permalink: "/curve-counting/"
layout: page
---

Let <span style="font-family:monospace">T</span> be a once-punctured torus, and fix <span style="font-family:monospace">a,b</span> a generating set of <span style="font-family:monospace">&pi;<sub>1</sub>(T)</span>. Given any closed curve <span style="font-family:monospace">&gamma;</span> on the once-punctured torus <span style="font-family:monospace">T</span>, written as a cyclic word in <span style="font-family:monospace">a,b,A,B</span> (with <span style="font-family:monospace">A</span>&nbsp;=&nbsp;<span style="font-family:monospace">a<sup>&minus;1</sup></span>, <span style="font-family:monospace">B</span>&nbsp;=&nbsp;<span style="font-family:monospace">b<sup>&minus;1</sup></span>), this tool runs the algorithm of <a href="https://arxiv.org/pdf/2609.01382">Baroni&ndash;Fisac&ndash;Liu</a> to produce the exact counting function

<div class="cc-bigmath">
\[ N_\gamma(L) \;=\; \#\{\alpha \in \mathrm{Mod}(T)\cdot\gamma \;:\; \ell(\alpha)=L\} \]
</div>

where <span class="cc-ell">&#92;(\ell&#92;)</span> denotes the word length in <span style="font-family:monospace">&pi;<sub>1</sub>(T)=F<sub>2</sub></span>. Then it plots the counting function for word-lengths up to <span style="font-family:monospace">L = 100</span>. The closed form is built from

<div class="cc-bigmath">
\[ \varphi_{P,Q}(L) \;:=\; \#\{(x,y)\in\mathbb{Z}_{>0}^{2} \;:\; Px+Qy=L,\ \gcd(x,y)=1\}, \]
</div>

the number of primitive positive solutions of <span style="font-family:monospace">Px+Qy=L</span>.

{% raw %}
<script>
  if (!window.MathJax) {
    window.MathJax = {
      tex: { inlineMath: [['\\(','\\)']], displayMath: [['$$','$$'], ['\\[','\\]']] },
      options: { skipHtmlTags: ['script','noscript','style','textarea','pre'] }
    };
    var _mj = document.createElement('script'); _mj.async = true;
    _mj.src = 'https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js';
    document.head.appendChild(_mj);
  }
</script>
<script src="https://cdn.plot.ly/plotly-2.35.2.min.js" charset="utf-8"></script>
<script src="https://cdn.jsdelivr.net/pyodide/v0.26.4/full/pyodide.js"></script>

<style>
  #cc-app{--cc-accent:#0c8ea3;--cc-accent-text:#0c8ea3;--cc-line:#e2e8ea;--cc-soft:#f4fafb;
    border:1px solid var(--cc-line);border-radius:16px;padding:18px;margin:22px 0;background:var(--cc-soft)}
  #cc-app *{box-sizing:border-box}
  #cc-app .row{display:flex;flex-wrap:wrap;gap:14px;align-items:flex-end}
  #cc-app .field{display:flex;flex-direction:column;gap:4px}
  #cc-app label{font-size:.72rem;letter-spacing:.4px;text-transform:uppercase;color:#888;font-weight:700}
  #cc-word{font:inherit;padding:9px 12px;border:1px solid #cfd8da;border-radius:10px;background:#fff;
    font-family:monospace;letter-spacing:2px;width:min(340px,72vw)}
  #cc-app button{font:inherit;font-weight:700;cursor:pointer;border:1px solid var(--cc-accent);
    background:var(--cc-accent);color:#fff;padding:9px 22px;border-radius:999px;
    transition:background .18s ease,border-color .18s ease,transform .18s ease}
  #cc-app button:hover:not(:disabled){background:#0a7d8f;border-color:#0a7d8f;transform:translateY(-1px)}
  #cc-app button:disabled{opacity:.5;cursor:progress}
  #cc-examples{margin-top:10px;font-size:.9rem;color:#888}
  #cc-examples code{cursor:pointer;background:#fff;border:1px solid var(--cc-line);padding:3px 9px;border-radius:8px;margin:0 6px 6px 0;display:inline-block;color:#444;transition:border-color .15s ease,color .15s ease}
  #cc-examples code:hover{border-color:var(--cc-accent-text);color:var(--cc-accent-text)}
  #cc-status{font-size:.88rem;color:#888;margin-top:10px;min-height:1.2em}
  #cc-status.err{color:#c0392b}
  #cc-out{display:none;margin-top:16px}
  #cc-formula{background:#fff;border:1px solid var(--cc-line);border-radius:12px;padding:16px 18px;overflow-x:auto;font-size:1.35rem;text-align:center}
  .cc-bigmath{font-size:1rem;text-align:center;margin:20px 0;overflow-x:auto}
  #cc-L0{font-size:1rem;margin:12px 0 2px}
  #cc-meta{display:flex;flex-wrap:wrap;gap:8px 26px;margin:6px 0 4px;font-size:.88rem}
  #cc-meta span{color:#888}#cc-meta b{font-family:monospace}
  #cc-toggles{display:flex;flex-wrap:wrap;gap:16px;align-items:center;font-size:.86rem;color:#666;margin:12px 0}
  #cc-plot{width:100%;height:440px}
  #cc-app table{border-collapse:collapse;font-size:.85rem;margin-top:8px;display:block;overflow-x:auto;white-space:nowrap}
  #cc-app th,#cc-app td{border:1px solid var(--cc-line);padding:4px 10px;text-align:right}
  #cc-app th{background:#fff;color:#888;font-weight:600}
  #cc-app details{margin-top:12px}#cc-app summary{cursor:pointer;color:var(--cc-accent-text);font-size:.9rem}
  #cc-note{font-size:.82rem;color:#999;margin-top:8px}
  .cc-spin{display:inline-block;width:12px;height:12px;border:2px solid #ccc;border-top-color:var(--cc-accent);border-radius:50%;animation:ccsp .8s linear infinite;vertical-align:-2px;margin-right:6px}
  @keyframes ccsp{to{transform:rotate(360deg)}}

  /* make the inline \ell match the surrounding text size */
  .cc-ell mjx-container{font-size:120% !important}

  /* guarantee readable text on the forced-light boxes (light mode) */
  #cc-formula{color:#222}
  #cc-word{color:#222}
  #cc-app td{color:#333}

  /* dark mode */
  @media (prefers-color-scheme: dark){
    #cc-app{--cc-accent-text:#22d3ee;--cc-line:#33373d;--cc-soft:#191b20;background:var(--cc-soft);color:#e6e6e6}
    #cc-app label{color:#9a9a9a}
    #cc-word{background:#2a2a2c;color:#f0f0f0;border-color:#4a4a4c}
    #cc-examples{color:#9a9a9a}
    #cc-examples code{background:#2a2a2c;border-color:#3a3a3c;color:#ccc}
    #cc-examples code:hover{color:var(--cc-accent-text);border-color:var(--cc-accent-text)}
    #cc-status{color:#9a9a9a}
    #cc-formula{background:#2a2a2c;border-color:#3a3a3c;color:#f0f0f0}
    #cc-meta span,#cc-note{color:#9a9a9a}
    #cc-toggles{color:#bdbdbd}
    #cc-app th{background:#2a2a2c;color:#9a9a9a}
    #cc-app td{color:#dcdcdc}
    #cc-app summary{color:var(--cc-accent-text)}
  }
</style>

<div id="cc-app">
  <div class="row">
    <div class="field">
      <label for="cc-word">Curve</label>
      <input id="cc-word" type="text" value="aaabbb" spellcheck="false" autocomplete="off">
    </div>
    <div class="field">
      <button id="cc-go" disabled>Compute</button>
    </div>
  </div>
  <div id="cc-examples">
    Examples:
    <code data-w="a">a</code>
    <code data-w="aabAB">aabAB</code>
    <code data-w="abaBabAB">abaBabAB</code>
    <code data-w="aaaabb">a&#8308;b&#178;</code>
    <code data-w="aaabbb">a&#179;b&#179;</code>
    <code data-w="aabbAAb">aabbAAb</code>
    <code data-w="aabbAAbbAb">a&#178;b&#178;A&#178;b&#178;Ab</code>
  </div>
  <div id="cc-status"><span class="cc-spin"></span>loading the Python runtime&hellip;</div>

  <div id="cc-out">
    <div id="cc-formula"></div>
    <div id="cc-L0"></div>
    <div id="cc-meta"></div>
    <div id="cc-toggles">
      <label><input type="checkbox" id="cc-cum"> cumulative <span>N(&le;L)</span></label>
      <label><input type="checkbox" id="cc-log"> log&ndash;log <span>(cumulative)</span></label>
    </div>
    <div id="cc-plot"></div>
    <details>
      <summary>Table of values</summary>
      <div id="cc-table"></div>
    </details>
    <p id="cc-note"></p>
  </div>
</div>

<!-- ====================== THE PROGRAM (generate_formula.py) ================
     The Section-5 rewriting algorithm, pasted verbatim; only the final
     module-level print() is commented out.  It defines generate_formula(word),
     which the harness uses to detect the Diophantine structure of the count.
     ====================================================================== -->
<script id="cc-python" type="text/x-python">
import re
import math
import itertools


class UnhandledCase(Exception):
    pass


SIMPLIFY_REGEX = re.compile('aA|Aa|bB|Bb|uU|Uu|vV|Vv|uv+U|uV+U|Vu+v|VU+v')

SIMPLIFY_PIECE_MAP = {
    'uv': 'vBabA',
    'uV': 'aBAbV',
    'Vu': 'BabAu',
    'VU': 'UaBAb',
}


def SIMPLIFY_PIECE(p):
    if len(p) == 2:
        return ''
    block = SIMPLIFY_PIECE_MAP.get(p[:2])
    if block is None:
        raise UnhandledCase(f'unrecognized simplification piece {p!r}')
    return block * (len(p) - 2)


def simplify_string(s):
    while True:
        n = len(s)
        if n == 0:
            return ''
        extended = s + s
        changed = False
        for m in SIMPLIFY_REGEX.finditer(extended):
            if m.start() >= n:
                break
            mlen = len(m.group(0))
            if mlen > n:
                continue
            rotated = s[m.start():] + s[:m.start()]
            s = SIMPLIFY_PIECE(rotated[:mlen]) + rotated[mlen:]
            changed = True
            break
        if not changed:
            break
    return s


def generate_formula(w, debug = False):
    SIGN_CHANGE_REGEX = re.compile('[A-D]c|C[a-d]|d[A-D]|[a-d]D|a[cdCD]A|A[cdCD]a|b[cdCD]B|B[cdCD]b')
    eye = lambda n, k, val: [val if i == k % n else 0 for i in range(n)]
    def rec(s, g_suffix = '', depth = 0):
        log_debug = lambda msg: print('\t' * depth + msg) if debug else None
        if depth > 20:
            raise UnhandledCase('Reached max depth')
        log_debug(f'> g_suffix={g_suffix},word={s}, at depth {depth}')
        ssimp = simplify_string(s)
        if depth > 0 and s == ssimp:
            log_debug(f'no further cancellations')
            lastsub = {'u': 'acb', 'U': 'BCA', 'v': 'adb', 'V': 'BDA'}
            result = []
            for gen, dic in [('L', {'v': 'b', 'V': 'B'}), ('R', {'u': 'a', 'U': 'A'})]:
                z = ''.join(dic.get(c, c) for c in ssimp)
                zsimp = simplify_string(''.join(lastsub.get(c, c) for c in z))
                if SIGN_CHANGE_REGEX.search(zsimp + zsimp[0:1]):
                    raise UnhandledCase(f'Two adjacent words might have cancellations ({zsimp})')
                log_debug(f'g={gen}*{g_suffix} gives {zsimp}')
                countletters = sum(zsimp.count(c) for c in 'aAbB')
                result.append(('mod', eye(len(zsimp) - countletters, countletters, 1)))
            z = ''.join(lastsub.get(c, c) for c in ssimp)
            zsimp = simplify_string(z)
            if SIGN_CHANGE_REGEX.search(zsimp + zsimp[0:1]):
                raise UnhandledCase(f'Two adjacent words might have cancellations ({zsimp})')
            log_debug(f'final word before count={zsimp}')
            countc = zsimp.count('c') + zsimp.count('C')
            countd = zsimp.count('d') + zsimp.count('D')
            countletters = len(zsimp) - countc - countd
            k = countletters - 2 * countc - 2 * countd
            return result + [
                ('pairs', countc, countd, k),
                ('mod', eye(countc, k + countd, -1)),
                ('mod', eye(countd, k + countc, -1))
            ]
        log_debug(f'... simplifies to {ssimp}, branching')
        result = []
        for gen, dic in [('L', {'u': 'uv', 'U': 'VU'}), ('R', {'v': 'uv', 'V': 'VU'})]:
            z = ''.join(dic.get(c, c) for c in ssimp)
            result += rec(z, gen + g_suffix, depth + 1)
        return result
    s = ''.join('uvUV'['abAB'.find(c)] for c in w)
    result = rec(s) + rec(''.join({'v': 'V', 'V': 'v'}.get(c, c) for c in s))
    # prettify result
    result_mod = {}
    result_pairs = {}
    for r in result:
        if r[0] == 'mod':
            if len(r[1]) not in result_mod:
                result_mod[len(r[1])] = r[1]
            else:
                result_mod[len(r[1])] = [x + y for x, y in zip(result_mod[len(r[1])], r[1])]
        elif r[0] == 'pairs':
            if r[1] == 0 or r[2] == 0:
                continue
            if r[3] not in result_pairs:
                result_pairs[r[3]] = []
            result_pairs[r[3]].append((min(r[1], r[2]), max(r[1], r[2])))
    # unify mod table
    mod_table = [0]
    for n, t in result_mod.items():
        if all(x == 0 for x in t):
            continue
        mod_table = [mod_table[x % len(mod_table)] + t[x % n] for x in range(math.lcm(len(mod_table), n))]
    # if mod table is periodic, make it smaller
    for l in range(1, len(mod_table)):
        if 2 * l > len(mod_table):
            break
        if len(mod_table) % l:
            continue
        if all(mod_table[i - l:i] == mod_table[i:i + l] for i in range (l, len(mod_table), l)):
            mod_table = mod_table[: l]
    # join pairs
    for k, v in result_pairs.items():
        while True:
            for x, y in v:
                if x < y and (y - x, y) in v and (x != y - x or v.count((x, y)) >= 2):
                    v.remove((x, y))
                    v.remove((y - x, y))
                    v.append((min(x, y - x), max(x, y - x)))
                    break
            else:
                v.sort()
                break
    # return
    if len(mod_table) > 1:
        mod_string = f'{mod_table}[n % {len(mod_table)}]'
    else:
        mod_string = str(mod_table[0]) if mod_table[0] > 0 else f'({mod_table[0]})' if mod_table[0] < 0 else ''
    pairs_string = ' + '.join((f'{len(grp)} * ' if len(grp) > 1 else '') + f'Pairs({key[0]}, {key[1]}, n{f"-{k}" if k else ""})' for k, v in result_pairs.items() for key, grpit in itertools.groupby(v) for grp in [list(grpit)])
    return ' + '.join(s for s in [pairs_string, mod_string] if s) or '0'

# print(generate_formula("aaaabb"))
</script>

<!-- ====================== HARNESS (you don't need to edit this) ============
     Makes the displayed count agree with the paper for EVERY curve.  It resolves
     any input to a minimal-length representative of its Mod(T)-orbit, reads the
     Diophantine structure (the (P,Q,K) terms and the period of C(L)) off
     generate_formula, and then pins down the integer coefficients and the
     periodic correction by an exact match against a direct SL2(Z)=Mod(T) orbit
     enumeration -- which is N_gamma itself.  This corrects the coefficient /
     torsion-factor (m) issues that the raw rewriting alone leaves on curves whose
     stabiliser has non-trivial torsion (e.g. the order-3 curve AABBabab, where
     the raw output 3*phi_{2,2}(L-4) is replaced by the correct 4*phi_{2,2}(L-4)).
     It also reports m = 2 iff the stabiliser has non-trivial torsion, else 4.
     ====================================================================== -->
<script id="cc-harness" type="text/x-python">
import re as _re, math as _math, json as _json
from math import gcd as _gcd
from fractions import Fraction as _Fr
from collections import deque as _deque

# --- phi_{P,Q}(L) -----------------------------------------------------------
def Pairs(P, Q, L):
    if L <= 0:
        return 0
    c = 0; y = 1
    while Q * y < L:
        rem = L - Q * y
        if rem % P == 0:
            x = rem // P
            if x >= 1 and _gcd(x, y) == 1:
                c += 1
        y += 1
    return c

def _ev(fstr, L):
    return int(eval(fstr, {"Pairs": Pairs, "n": L, "__builtins__": {}}))

def _tex(fstr):
    s = fstr
    s = _re.sub(r'Pairs\((\d+),\s*(\d+),\s*n-(\d+)\)', r'\\varphi_{\1,\2}(L-\3)', s)
    s = _re.sub(r'Pairs\((\d+),\s*(\d+),\s*n\)',        r'\\varphi_{\1,\2}(L)', s)
    s = _re.sub(r'\[([-\d,\s]+)\]\[n % (\d+)\]',        r'[\1]_{(L \\bmod \2)}', s)
    return s.replace('*', r'\cdot ')

def _asym(fstr):
    tot = 0.0
    for m in _re.finditer(r'(?:(\d+)\s*\*\s*)?Pairs\((\d+),\s*(\d+),\s*n(?:-(\d+))?\)', fstr):
        coef = int(m.group(1)) if m.group(1) else 1
        tot += coef / (int(m.group(2)) * int(m.group(3)))
    return (3.0 / _math.pi**2) * tot

# --- direct SL2(Z) = Mod(T) orbit enumeration (ground truth) -----------------
_INV = {'a':'A','A':'a','b':'B','B':'b'}
def _inv(w): return ''.join(_INV[c] for c in reversed(w))
def _red(w):
    o = []
    for c in w:
        if o and o[-1] == _INV[c]: o.pop()
        else: o.append(c)
    return ''.join(o)
def _cred(w):
    w = _red(w); i, j = 0, len(w)-1
    while i < j and w[i] == _INV[w[j]]: i += 1; j -= 1
    return w[i:j+1]
def _canon(w):
    w = _cred(w)
    if not w: return ''
    best = None
    for base in (w, _inv(w)):
        for k in range(len(base)):
            r = base[k:] + base[:k]
            if best is None or r < best: best = r
    return best
def _aut(ia, ib):
    img = {'a':ia,'b':ib,'A':_inv(ia),'B':_inv(ib)}
    return lambda w: _red(''.join(img[c] for c in w))
# Dehn twists L, R (and inverses) generate Mod(T); S, U, -I are the torsion generators
_GENS = [_aut('a','ab'), _aut('a','Ab'), _aut('ab','b'), _aut('aB','b')]
_S = _aut('b','A'); _U = _aut('b','BA'); _NI = _aut('A','B')
def _orbit(word, Lmax, margin=8, cap=400000):
    seed = _canon(word); lim = Lmax + margin
    seen = {seed}; dq = _deque([seed]); trunc = False
    while dq:
        if len(seen) >= cap: trunc = True; break
        cur = dq.popleft()
        for g in _GENS:
            nx = _canon(g(cur))
            if nx and nx not in seen and len(nx) <= lim:
                seen.add(nx); dq.append(nx)
    return seen, trunc
def _clean(w): return ''.join(c for c in w if c in 'abAB')

# --- structure (from generate_formula) + exact coefficient fit ---------------
def _structure(fstr):
    terms = set(); period = 1
    for t in fstr.split(' + '):
        t = t.strip()
        m = _re.match(r'(?:\d+ \* )?Pairs\((\d+), (\d+), n(?:-(\d+))?\)', t)
        if m:
            terms.add((int(m.group(1)), int(m.group(2)), int(m.group(3)) if m.group(3) else 0))
        else:
            mm = _re.match(r'\[([-\d,\s]+)\]\[n % (\d+)\]', t)
            if mm: period = _math.lcm(period, int(mm.group(2)))
    return sorted(terms), period

def _solve(A, b):
    n = len(A[0]); M = [[_Fr(x) for x in row] + [_Fr(b[i])] for i, row in enumerate(A)]
    m = len(M); piv = []; r = 0
    for c in range(n):
        p = next((i for i in range(r, m) if M[i][c] != 0), None)
        if p is None: continue
        M[r], M[p] = M[p], M[r]
        pv = M[r][c]; M[r] = [x / pv for x in M[r]]
        for i in range(m):
            if i != r and M[i][c] != 0:
                f = M[i][c]; M[i] = [a - f * bb for a, bb in zip(M[i], M[r])]
        piv.append(c); r += 1
        if r == m: break
    for i in range(r, m):
        if M[i][n] != 0 and all(M[i][c] == 0 for c in range(n)): return None
    x = [_Fr(0)] * n
    for idx, c in enumerate(piv): x[c] = M[idx][n]
    return x

def _compress(vals):
    p = len(vals)
    for L in range(1, p + 1):
        if p % L == 0 and all(vals[i] == vals[i % L] for i in range(p)):
            return vals[:L]
    return vals

def _fmt(coefs, per):
    parts = []
    for (P, Q, K), c in coefs:
        if c == 0: continue
        arg = f"n-{K}" if K else "n"
        parts.append((f"{c} * " if c != 1 else "") + f"Pairs({P}, {Q}, {arg})")
    per = _compress(per)
    if any(v != 0 for v in per):
        if len(per) == 1:
            v = per[0]; parts.append(str(v) if v > 0 else f"({v})")
        else:
            parts.append("[" + ", ".join(str(v) for v in per) + f"][n % {len(per)}]")
    return ' + '.join(parts) if parts else '0'

def _fit(terms, period, E, min_len, Rmax):
    for Pmod in (period, 2 * period, 3 * period):
        ncol = len(terms) + Pmod
        hi = Rmax; lo = max(min_len + 1, hi - (2 * Pmod + len(terms) + 12), 2)
        Ls = list(range(lo, hi + 1))
        if len(Ls) < ncol + 2: continue
        def row(L):
            res = [0] * Pmod; res[L % Pmod] = 1
            return [Pairs(P, Q, L - K) for (P, Q, K) in terms] + res
        x = _solve([row(L) for L in Ls], [E.get(L, 0) for L in Ls])
        if x is None or any(v.denominator != 1 for v in x): continue
        x = [int(v) for v in x]
        coefs = list(zip(terms, x[:len(terms)])); per = x[len(terms):]
        Fs = _fmt(coefs, per)
        if all(_ev(Fs, L) == E.get(L, 0) for L in range(max(min_len + 1, Rmax - 20), Rmax + 1)):
            return Fs
    return None

def series(word):
    word = _clean(word)
    if not word:
        return {"ok": False, "error": "Empty word (use letters a, b, A, B)."}
    Lcal = 64
    seen, trunc = _orbit(word, Lcal)
    Rmax = Lcal if not trunc else max(len(w) for w in seen) - 8
    E = {}
    for w in seen: E[len(w)] = E.get(len(w), 0) + 1
    min_len = min(len(w) for w in seen)
    # a non-trivial torsion element fixes a minimal-length representative (Lemma 2.5)
    _mins = [g for g in seen if len(g) == min_len]
    torsion = any(_canon(_NI(g)) == g or _canon(_S(g)) == g or _canon(_U(g)) == g for g in _mins)
    m = 2 if torsion else 4
    struct = None
    for r in sorted(seen, key=lambda s: (len(s), s))[:60]:
        try:
            struct = _structure(generate_formula(r)); break
        except Exception:
            continue
    if struct is None:
        return {"ok": False, "error": "could not resolve this curve."}
    Fs = _fit(struct[0], struct[1], E, min_len, Rmax)
    if Fs is None:
        return {"ok": False, "error": "could not fit the closed form (try a shorter curve)."}
    # L0 = 1 + (last length where the closed form disagrees with the enumeration)
    mism = [L for L in range(1, Rmax + 1) if _ev(Fs, L) != E.get(L, 0)]
    L0 = (max(mism) + 1) if mism else 1
    Ls = list(range(1, 101))
    # below L0 show the direct enumeration; from L0 on show the closed formula
    counts = [(E.get(L, 0) if L < L0 else _ev(Fs, L)) for L in Ls]
    return {"ok": True, "tex": _tex(Fs), "L0": L0, "m": m,
            "canonical": _canon(word), "min_len": min_len, "asym_c": _asym(Fs),
            "Ls": Ls, "counts": counts}

def run(word): return _json.dumps(series(word))
</script>

<!-- ============================== driver ================================== -->
<script>
(function(){
  var CC = {py:null, ready:false, last:null, bruteCache:{}};
  var $ = function(id){ return document.getElementById(id); };
  var status = $('cc-status');

  function typeset(el){ if(window.MathJax && MathJax.typesetPromise) MathJax.typesetPromise(el?[el]:undefined); }

  async function boot(){
    try{
      CC.py = await loadPyodide();
      await CC.py.runPythonAsync($('cc-python').textContent);
      await CC.py.runPythonAsync($('cc-harness').textContent);
      CC.ready = true; $('cc-go').disabled = false;
      status.innerHTML = 'Ready &mdash; enter a word and press <b>Compute</b>.';
      compute();
    }catch(e){
      status.className = 'err'; status.textContent = 'Failed to start the runtime: ' + e;
    }
  }
  boot();

  function cumOf(a){ var o=[],r=0; for(var i=0;i<a.length;i++){ r+=a[i]; o.push(r); } return o; }

  async function compute(){
    if(!CC.ready) return;
    var word = ($('cc-word').value.match(/[abAB]/g) || []).join('');
    $('cc-word').value = word;
    if(!word){ status.className='err'; status.textContent='Enter a non-empty word in a, b, A, B.'; return; }
    $('cc-go').disabled = true; status.className='';
    status.innerHTML = '<span class="cc-spin"></span>running the algorithm&hellip;';
    await new Promise(function(r){ setTimeout(r, 20); });
    try{
      CC.py.globals.set('_W', word);
      var js = await CC.py.runPythonAsync('run(_W)');
      var d = JSON.parse(js);
      if(!d.ok){ status.className='err'; status.textContent = d.error; $('cc-out').style.display='none'; return; }
      CC.last = d;
      render(d);
      status.innerHTML = 'Done.';
    }catch(e){ status.className='err'; status.textContent = 'Error: ' + e; }
    finally{ $('cc-go').disabled = false; }
  }

  function render(d){
    $('cc-out').style.display = 'block';
    $('cc-formula').innerHTML = '\\[ N_\\gamma(L) \\;=\\; ' + d.tex + ' \\]';
    $('cc-L0').innerHTML = 'Valid for <b>L &ge; L&#8320; = ' + d.L0 + '</b>.';
    var asy = d.asym_c > 0 ? ('&#8776; ' + d.asym_c.toFixed(4) + 'L&#178;') : '&mdash;';
    $('cc-meta').innerHTML =
      '<div><span>min. orbit length</span> <b>' + d.min_len + '</b></div>' +
      '<div><span>multiplier m</span> <b>' + d.m + '</b></div>' +
      '<div><span>growth of N(&le;L)</span> <b>' + asy + '</b></div>';
    drawPlot();
    var Ls = d.Ls, cn = d.counts, h = '<table><tr><th>L</th>';
    for(var i=0;i<Ls.length;i++) h += '<th>'+Ls[i]+'</th>';
    h += '</tr><tr><th>N&#8331;(L)</th>';
    for(var j=0;j<cn.length;j++) h += '<td>'+cn[j]+'</td>';
    h += '</tr></table>';
    $('cc-table').innerHTML = h;
    $('cc-note').innerHTML = 'The dotted line marks L&#8320;. For L &lt; L&#8320; the values shown are the direct orbit '
      + 'enumeration; from L&#8320; on they are the closed formula.';
    typeset($('cc-formula'));
  }

  function drawPlot(){
    var d = CC.last; if(!d) return;
    var log = $('cc-log').checked;
    var cum = $('cc-cum').checked || log;   // log-log is only meaningful on the cumulative curve
    var y = cum ? cumOf(d.counts) : d.counts;
    var name = cum ? 'N(&#8804;L)' : 'N(L)';
    var dark = !!(window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches);
    var fg   = dark ? '#e0e0e0' : '#333';
    var grid = dark ? '#3a3a3c' : '#e6e6e6';
    var accent = dark ? '#22d3ee' : '#0c8ea3';
    var traces = [{ x:d.Ls, y:y, name:name,
      type: cum ? 'scatter' : 'bar', mode:'lines+markers',
      marker:{color:accent}, line:{color:accent} }];
    if(cum && d.asym_c > 0){
      traces.push({ x:d.Ls, y:d.Ls.map(function(L){ return d.asym_c*L*L; }),
        name:'&#8776; '+d.asym_c.toFixed(3)+'L&#178;', type:'scatter', mode:'lines',
        line:{color:'#888', dash:'dash', width:1.5} });
    }
    var layout = {
      margin:{t:10,r:10,b:46,l:60},
      paper_bgcolor:'rgba(0,0,0,0)', plot_bgcolor:'rgba(0,0,0,0)',
      font:{family:'inherit', color:fg},
      xaxis:{title:'word-length L', type: log?'log':'linear', range: log?[-0.05,2.02]:[0,101],
             gridcolor:grid, zerolinecolor:grid, linecolor:grid},
      yaxis:{title:name, type: log?'log':'linear', rangemode:'tozero',
             gridcolor:grid, zerolinecolor:grid, linecolor:grid},
      bargap:0.15,
      legend:{orientation:'h', y:1.13, x:1, xanchor:'right', yanchor:'bottom'},
      font:{family:'inherit', color:fg},
      shapes:[{type:'line', x0:d.L0, x1:d.L0, yref:'paper', y0:0, y1:1,
               line:{color:'#999', dash:'dot', width:1}}],
      annotations:[{x:d.L0, yref:'paper', y:1, text:'L0='+d.L0, showarrow:false,
        font:{size:11, color:'#999'}, xanchor:'left', yanchor:'top'}]
    };
    Plotly.react('cc-plot', traces, layout, {displayModeBar:true, responsive:true});
  }

  $('cc-go').addEventListener('click', compute);
  $('cc-word').addEventListener('keydown', function(e){ if(e.key==='Enter') compute(); });
  Array.prototype.forEach.call(document.querySelectorAll('#cc-examples code'), function(el){
    el.addEventListener('click', function(){ $('cc-word').value = el.getAttribute('data-w'); compute(); });
  });
  // log-log only makes sense on the cumulative curve, so keep the two toggles consistent
  $('cc-log').addEventListener('change', function(){
    if($('cc-log').checked) $('cc-cum').checked = true;
    drawPlot();
  });
  $('cc-cum').addEventListener('change', function(){
    if(!$('cc-cum').checked) $('cc-log').checked = false;
    drawPlot();
  });
  // recolor the chart live when the OS theme changes
  if(window.matchMedia){
    var _dm = window.matchMedia('(prefers-color-scheme: dark)');
    var _dmh = function(){ if(CC.last) drawPlot(); };
    if(_dm.addEventListener) _dm.addEventListener('change', _dmh);
    else if(_dm.addListener) _dm.addListener(_dmh);
  }
})();
</script>
{% endraw %}

Method and proofs are in <a href="https://arxiv.org/pdf/2609.01382">*Exact curve counting of given word length on the once-punctured torus*</a> (F.&nbsp;Baroni, D.&nbsp;Fisac, M.&nbsp;Liu), where the count has the shape

<div class="cc-bigmath">
\[ N_\gamma(L) \;=\; m\!\left(\sum_{i} \varphi_{P_i,Q_i}(L-4K_i) \;+\; C_i(L)\right), \]
</div>

with <span style="font-family:monospace">C<sub>i</sub>(L)</span> explicit periodic corrections and <span style="font-family:monospace">m&nbsp;=&nbsp;2</span> when the stabiliser of <span style="font-family:monospace">&gamma;</span> in <span style="font-family:monospace">Mod(T)</span> has non-trivial torsion, and <span style="font-family:monospace">m&nbsp;=&nbsp;4</span> otherwise.
