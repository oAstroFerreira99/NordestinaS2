const qn = function () {
    const e = document.createElement("link").relList;
    if (e && e.supports && e.supports("modulepreload")) return;
    for (const i of document.querySelectorAll('link[rel="modulepreload"]')) n(i);
    new MutationObserver((i) => {
      for (const s of i)
        if (s.type === "childList")
          for (const l of s.addedNodes)
            l.tagName === "LINK" && l.rel === "modulepreload" && n(l);
    }).observe(document, { childList: !0, subtree: !0 });
    function r(i) {
      const s = {};
      return (
        i.integrity && (s.integrity = i.integrity),
        i.referrerpolicy && (s.referrerPolicy = i.referrerpolicy),
        i.crossorigin === "use-credentials"
          ? (s.credentials = "include")
          : i.crossorigin === "anonymous"
          ? (s.credentials = "omit")
          : (s.credentials = "same-origin"),
        s
      );
    }
    function n(i) {
      if (i.ep) return;
      i.ep = !0;
      const s = r(i);
      fetch(i.href, s);
    }
  };
  qn();
  function F() {}
  const Ft = (t) => t;
  function ft(t, e) {
    for (const r in e) t[r] = e[r];
    return t;
  }
  function Vn(t) {
    return t && typeof t == "object" && typeof t.then == "function";
  }
  function Gr(t) {
    return t();
  }
  function nr() {
    return Object.create(null);
  }
  function re(t) {
    t.forEach(Gr);
  }
  function Se(t) {
    return typeof t == "function";
  }
  function ne(t, e) {
    return t != t
      ? e == e
      : t !== e || (t && typeof t == "object") || typeof t == "function";
  }
  let nt;
  function Y(t, e) {
    return nt || (nt = document.createElement("a")), (nt.href = e), t === nt.href;
  }
  function Jn(t) {
    return Object.keys(t).length === 0;
  }
  function Ht(t, ...e) {
    if (t == null) return F;
    const r = t.subscribe(...e);
    return r.unsubscribe ? () => r.unsubscribe() : r;
  }
  function pe(t) {
    let e;
    return Ht(t, (r) => (e = r))(), e;
  }
  function q(t, e, r) {
    t.$$.on_destroy.push(Ht(e, r));
  }
  function ir(t) {
    const e = {};
    for (const r in t) r[0] !== "$" && (e[r] = t[r]);
    return e;
  }
  function Le(t, e, r) {
    return t.set(r), e;
  }
  const Qr = typeof window < "u";
  let Zr = Qr ? () => window.performance.now() : () => Date.now(),
    qt = Qr ? (t) => requestAnimationFrame(t) : F;
  const Ne = new Set();
  function en(t) {
    Ne.forEach((e) => {
      e.c(t) || (Ne.delete(e), e.f());
    }),
      Ne.size !== 0 && qt(en);
  }
  function tn(t) {
    let e;
    return (
      Ne.size === 0 && qt(en),
      {
        promise: new Promise((r) => {
          Ne.add((e = { c: t, f: r }));
        }),
        abort() {
          Ne.delete(e);
        },
      }
    );
  }
  function f(t, e) {
    t.appendChild(e);
  }
  function rn(t) {
    if (!t) return document;
    const e = t.getRootNode ? t.getRootNode() : t.ownerDocument;
    return e && e.host ? e : t.ownerDocument;
  }
  function Wn(t) {
    const e = w("style");
    return Kn(rn(t), e), e.sheet;
  }
  function Kn(t, e) {
    f(t.head || t, e);
  }
  function M(t, e, r) {
    t.insertBefore(e, r || null);
  }
  function j(t) {
    t.parentNode.removeChild(t);
  }
  function gt(t, e) {
    for (let r = 0; r < t.length; r += 1) t[r] && t[r].d(e);
  }
  function w(t) {
    return document.createElement(t);
  }
  function V(t) {
    return document.createTextNode(t);
  }
  function R() {
    return V(" ");
  }
  function _e() {
    return V("");
  }
  function H(t, e, r, n) {
    return t.addEventListener(e, r, n), () => t.removeEventListener(e, r, n);
  }
  function h(t, e, r) {
    r == null
      ? t.removeAttribute(e)
      : t.getAttribute(e) !== r && t.setAttribute(e, r);
  }
  function Yn(t) {
    return t === "" ? null : +t;
  }
  function Xn(t) {
    return Array.from(t.childNodes);
  }
  function te(t, e) {
    (e = "" + e), t.wholeText !== e && (t.data = e);
  }
  function Me(t, e) {
    t.value = e ?? "";
  }
  function Gn(t, e, r, n) {
    r === null
      ? t.style.removeProperty(e)
      : t.style.setProperty(e, r, n ? "important" : "");
  }
  function nn(t, e, { bubbles: r = !1, cancelable: n = !1 } = {}) {
    const i = document.createEvent("CustomEvent");
    return i.initCustomEvent(t, r, n, e), i;
  }
  const dt = new Map();
  let pt = 0;
  function Qn(t) {
    let e = 5381,
      r = t.length;
    for (; r--; ) e = ((e << 5) - e) ^ t.charCodeAt(r);
    return e >>> 0;
  }
  function Zn(t, e) {
    const r = { stylesheet: Wn(e), rules: {} };
    return dt.set(t, r), r;
  }
  function $t(t, e, r, n, i, s, l, a = 0) {
    const o = 16.666 / n;
    let u = `{
  `;
    for (let b = 0; b <= 1; b += o) {
      const k = e + (r - e) * s(b);
      u +=
        b * 100 +
        `%{${l(k, 1 - k)}}
  `;
    }
    const c =
        u +
        `100% {${l(r, 1 - r)}}
  }`,
      d = `__svelte_${Qn(c)}_${a}`,
      p = rn(t),
      { stylesheet: _, rules: m } = dt.get(p) || Zn(p, t);
    m[d] ||
      ((m[d] = !0), _.insertRule(`@keyframes ${d} ${c}`, _.cssRules.length));
    const g = t.style.animation || "";
    return (
      (t.style.animation = `${
        g ? `${g}, ` : ""
      }${d} ${n}ms linear ${i}ms 1 both`),
      (pt += 1),
      d
    );
  }
  function Lt(t, e) {
    const r = (t.style.animation || "").split(", "),
      n = r.filter(
        e ? (s) => s.indexOf(e) < 0 : (s) => s.indexOf("__svelte") === -1
      ),
      i = r.length - n.length;
    i && ((t.style.animation = n.join(", ")), (pt -= i), pt || ei());
  }
  function ei() {
    qt(() => {
      pt ||
        (dt.forEach((t) => {
          const { stylesheet: e } = t;
          let r = e.cssRules.length;
          for (; r--; ) e.deleteRule(r);
          t.rules = {};
        }),
        dt.clear());
    });
  }
  let Xe;
  function ke(t) {
    Xe = t;
  }
  function tt() {
    if (!Xe) throw new Error("Function called outside component initialization");
    return Xe;
  }
  function sn(t) {
    tt().$$.on_mount.push(t);
  }
  function ti(t) {
    tt().$$.after_update.push(t);
  }
  function Vt(t) {
    tt().$$.on_destroy.push(t);
  }
  function ri() {
    const t = tt();
    return (e, r, { cancelable: n = !1 } = {}) => {
      const i = t.$$.callbacks[e];
      if (i) {
        const s = nn(e, r, { cancelable: n });
        return (
          i.slice().forEach((l) => {
            l.call(t, s);
          }),
          !s.defaultPrevented
        );
      }
      return !0;
    };
  }
  function Nt(t, e) {
    const r = t.$$.callbacks[e.type];
    r && r.slice().forEach((n) => n.call(this, e));
  }
  const Je = [],
    jt = [],
    lt = [],
    sr = [],
    ln = Promise.resolve();
  let Mt = !1;
  function on() {
    Mt || ((Mt = !0), ln.then(Jt));
  }
  function an() {
    return on(), ln;
  }
  function ae(t) {
    lt.push(t);
  }
  const St = new Set();
  let it = 0;
  function Jt() {
    const t = Xe;
    do {
      for (; it < Je.length; ) {
        const e = Je[it];
        it++, ke(e), ni(e.$$);
      }
      for (ke(null), Je.length = 0, it = 0; jt.length; ) jt.pop()();
      for (let e = 0; e < lt.length; e += 1) {
        const r = lt[e];
        St.has(r) || (St.add(r), r());
      }
      lt.length = 0;
    } while (Je.length);
    for (; sr.length; ) sr.pop()();
    (Mt = !1), St.clear(), ke(t);
  }
  function ni(t) {
    if (t.fragment !== null) {
      t.update(), re(t.before_update);
      const e = t.dirty;
      (t.dirty = [-1]),
        t.fragment && t.fragment.p(t.ctx, e),
        t.after_update.forEach(ae);
    }
  }
  let qe;
  function cn() {
    return (
      qe ||
        ((qe = Promise.resolve()),
        qe.then(() => {
          qe = null;
        })),
      qe
    );
  }
  function Ye(t, e, r) {
    t.dispatchEvent(nn(`${e ? "intro" : "outro"}${r}`));
  }
  const ot = new Set();
  let xe;
  function G() {
    xe = { r: 0, c: [], p: xe };
  }
  function Q() {
    xe.r || re(xe.c), (xe = xe.p);
  }
  function N(t, e) {
    t && t.i && (ot.delete(t), t.i(e));
  }
  function U(t, e, r, n) {
    if (t && t.o) {
      if (ot.has(t)) return;
      ot.add(t),
        xe.c.push(() => {
          ot.delete(t), n && (r && t.d(1), n());
        }),
        t.o(e);
    } else n && n();
  }
  const un = { duration: 0 };
  function ii(t, e, r) {
    let n = e(t, r),
      i = !1,
      s,
      l,
      a = 0;
    function o() {
      s && Lt(t, s);
    }
    function u() {
      const {
        delay: d = 0,
        duration: p = 300,
        easing: _ = Ft,
        tick: m = F,
        css: g,
      } = n || un;
      g && (s = $t(t, 0, 1, p, d, _, g, a++)), m(0, 1);
      const b = Zr() + d,
        k = b + p;
      l && l.abort(),
        (i = !0),
        ae(() => Ye(t, !0, "start")),
        (l = tn((y) => {
          if (i) {
            if (y >= k) return m(1, 0), Ye(t, !0, "end"), o(), (i = !1);
            if (y >= b) {
              const T = _((y - b) / p);
              m(T, 1 - T);
            }
          }
          return i;
        }));
    }
    let c = !1;
    return {
      start() {
        c || ((c = !0), Lt(t), Se(n) ? ((n = n()), cn().then(u)) : u());
      },
      invalidate() {
        c = !1;
      },
      end() {
        i && (o(), (i = !1));
      },
    };
  }
  function ee(t, e, r, n) {
    let i = e(t, r),
      s = n ? 0 : 1,
      l = null,
      a = null,
      o = null;
    function u() {
      o && Lt(t, o);
    }
    function c(p, _) {
      const m = p.b - s;
      return (
        (_ *= Math.abs(m)),
        {
          a: s,
          b: p.b,
          d: m,
          duration: _,
          start: p.start,
          end: p.start + _,
          group: p.group,
        }
      );
    }
    function d(p) {
      const {
          delay: _ = 0,
          duration: m = 300,
          easing: g = Ft,
          tick: b = F,
          css: k,
        } = i || un,
        y = { start: Zr() + _, b: p };
      p || ((y.group = xe), (xe.r += 1)),
        l || a
          ? (a = y)
          : (k && (u(), (o = $t(t, s, p, m, _, g, k))),
            p && b(0, 1),
            (l = c(y, m)),
            ae(() => Ye(t, p, "start")),
            tn((T) => {
              if (
                (a &&
                  T > a.start &&
                  ((l = c(a, m)),
                  (a = null),
                  Ye(t, l.b, "start"),
                  k && (u(), (o = $t(t, s, l.b, l.duration, 0, g, i.css)))),
                l)
              ) {
                if (T >= l.end)
                  b((s = l.b), 1 - s),
                    Ye(t, l.b, "end"),
                    a || (l.b ? u() : --l.group.r || re(l.group.c)),
                    (l = null);
                else if (T >= l.start) {
                  const E = T - l.start;
                  (s = l.a + l.d * g(E / l.duration)), b(s, 1 - s);
                }
              }
              return !!(l || a);
            }));
    }
    return {
      run(p) {
        Se(i)
          ? cn().then(() => {
              (i = i()), d(p);
            })
          : d(p);
      },
      end() {
        u(), (l = a = null);
      },
    };
  }
  function lr(t, e) {
    const r = (e.token = {});
    function n(i, s, l, a) {
      if (e.token !== r) return;
      e.resolved = a;
      let o = e.ctx;
      l !== void 0 && ((o = o.slice()), (o[l] = a));
      const u = i && (e.current = i)(o);
      let c = !1;
      e.block &&
        (e.blocks
          ? e.blocks.forEach((d, p) => {
              p !== s &&
                d &&
                (G(),
                U(d, 1, 1, () => {
                  e.blocks[p] === d && (e.blocks[p] = null);
                }),
                Q());
            })
          : e.block.d(1),
        u.c(),
        N(u, 1),
        u.m(e.mount(), e.anchor),
        (c = !0)),
        (e.block = u),
        e.blocks && (e.blocks[s] = u),
        c && Jt();
    }
    if (Vn(t)) {
      const i = tt();
      if (
        (t.then(
          (s) => {
            ke(i), n(e.then, 1, e.value, s), ke(null);
          },
          (s) => {
            if ((ke(i), n(e.catch, 2, e.error, s), ke(null), !e.hasCatch))
              throw s;
          }
        ),
        e.current !== e.pending)
      )
        return n(e.pending, 0), !0;
    } else {
      if (e.current !== e.then) return n(e.then, 1, e.value, t), !0;
      e.resolved = t;
    }
  }
  function si(t, e, r) {
    const n = e.slice(),
      { resolved: i } = t;
    t.current === t.then && (n[t.value] = i),
      t.current === t.catch && (n[t.error] = i),
      t.block.p(n, r);
  }
  const li =
    typeof window < "u" ? window : typeof globalThis < "u" ? globalThis : global;
  function fn(t, e) {
    U(t, 1, 1, () => {
      e.delete(t.key);
    });
  }
  function dn(t, e, r, n, i, s, l, a, o, u, c, d) {
    let p = t.length,
      _ = s.length,
      m = p;
    const g = {};
    for (; m--; ) g[t[m].key] = m;
    const b = [],
      k = new Map(),
      y = new Map();
    for (m = _; m--; ) {
      const v = d(i, s, m),
        $ = r(v);
      let x = l.get($);
      x ? n && x.p(v, e) : ((x = u($, v)), x.c()),
        k.set($, (b[m] = x)),
        $ in g && y.set($, Math.abs(m - g[$]));
    }
    const T = new Set(),
      E = new Set();
    function S(v) {
      N(v, 1), v.m(a, c), l.set(v.key, v), (c = v.first), _--;
    }
    for (; p && _; ) {
      const v = b[_ - 1],
        $ = t[p - 1],
        x = v.key,
        D = $.key;
      v === $
        ? ((c = v.first), p--, _--)
        : k.has(D)
        ? !l.has(x) || T.has(x)
          ? S(v)
          : E.has(D)
          ? p--
          : y.get(x) > y.get(D)
          ? (E.add(x), S(v))
          : (T.add(D), p--)
        : (o($, l), p--);
    }
    for (; p--; ) {
      const v = t[p];
      k.has(v.key) || o(v, l);
    }
    for (; _; ) S(b[_ - 1]);
    return b;
  }
  function pn(t, e) {
    const r = {},
      n = {},
      i = { $$scope: 1 };
    let s = t.length;
    for (; s--; ) {
      const l = t[s],
        a = e[s];
      if (a) {
        for (const o in l) o in a || (n[o] = 1);
        for (const o in a) i[o] || ((r[o] = a[o]), (i[o] = 1));
        t[s] = a;
      } else for (const o in l) i[o] = 1;
    }
    for (const l in n) l in r || (r[l] = void 0);
    return r;
  }
  function mn(t) {
    return typeof t == "object" && t !== null ? t : {};
  }
  function oe(t) {
    t && t.c();
  }
  function se(t, e, r, n) {
    const { fragment: i, on_mount: s, on_destroy: l, after_update: a } = t.$$;
    i && i.m(e, r),
      n ||
        ae(() => {
          const o = s.map(Gr).filter(Se);
          l ? l.push(...o) : re(o), (t.$$.on_mount = []);
        }),
      a.forEach(ae);
  }
  function le(t, e) {
    const r = t.$$;
    r.fragment !== null &&
      (re(r.on_destroy),
      r.fragment && r.fragment.d(e),
      (r.on_destroy = r.fragment = null),
      (r.ctx = []));
  }
  function oi(t, e) {
    t.$$.dirty[0] === -1 && (Je.push(t), on(), t.$$.dirty.fill(0)),
      (t.$$.dirty[(e / 31) | 0] |= 1 << e % 31);
  }
  function fe(t, e, r, n, i, s, l, a = [-1]) {
    const o = Xe;
    ke(t);
    const u = (t.$$ = {
      fragment: null,
      ctx: null,
      props: s,
      update: F,
      not_equal: i,
      bound: nr(),
      on_mount: [],
      on_destroy: [],
      on_disconnect: [],
      before_update: [],
      after_update: [],
      context: new Map(e.context || (o ? o.$$.context : [])),
      callbacks: nr(),
      dirty: a,
      skip_bound: !1,
      root: e.target || o.$$.root,
    });
    l && l(u.root);
    let c = !1;
    if (
      ((u.ctx = r
        ? r(t, e.props || {}, (d, p, ..._) => {
            const m = _.length ? _[0] : p;
            return (
              u.ctx &&
                i(u.ctx[d], (u.ctx[d] = m)) &&
                (!u.skip_bound && u.bound[d] && u.bound[d](m), c && oi(t, d)),
              p
            );
          })
        : []),
      u.update(),
      (c = !0),
      re(u.before_update),
      (u.fragment = n ? n(u.ctx) : !1),
      e.target)
    ) {
      if (e.hydrate) {
        const d = Xn(e.target);
        u.fragment && u.fragment.l(d), d.forEach(j);
      } else u.fragment && u.fragment.c();
      e.intro && N(t.$$.fragment),
        se(t, e.target, e.anchor, e.customElement),
        Jt();
    }
    ke(o);
  }
  class de {
    $destroy() {
      le(this, 1), (this.$destroy = F);
    }
    $on(e, r) {
      const n = this.$$.callbacks[e] || (this.$$.callbacks[e] = []);
      return (
        n.push(r),
        () => {
          const i = n.indexOf(r);
          i !== -1 && n.splice(i, 1);
        }
      );
    }
    $set(e) {
      this.$$set &&
        !Jn(e) &&
        ((this.$$.skip_bound = !0), this.$$set(e), (this.$$.skip_bound = !1));
    }
  }
  const Pe = [];
  function hn(t, e) {
    return { subscribe: ye(t, e).subscribe };
  }
  function ye(t, e = F) {
    let r;
    const n = new Set();
    function i(a) {
      if (ne(t, a) && ((t = a), r)) {
        const o = !Pe.length;
        for (const u of n) u[1](), Pe.push(u, t);
        if (o) {
          for (let u = 0; u < Pe.length; u += 2) Pe[u][0](Pe[u + 1]);
          Pe.length = 0;
        }
      }
    }
    function s(a) {
      i(a(t));
    }
    function l(a, o = F) {
      const u = [a, o];
      return (
        n.add(u),
        n.size === 1 && (r = e(i) || F),
        a(t),
        () => {
          n.delete(u), n.size === 0 && (r(), (r = null));
        }
      );
    }
    return { set: i, update: s, subscribe: l };
  }
  function gn(t, e, r) {
    const n = !Array.isArray(t),
      i = n ? [t] : t,
      s = e.length < 2;
    return hn(r, (l) => {
      let a = !1;
      const o = [];
      let u = 0,
        c = F;
      const d = () => {
          if (u) return;
          c();
          const _ = e(n ? o[0] : o, l);
          s ? l(_) : (c = Se(_) ? _ : F);
        },
        p = i.map((_, m) =>
          Ht(
            _,
            (g) => {
              (o[m] = g), (u &= ~(1 << m)), a && d();
            },
            () => {
              u |= 1 << m;
            }
          )
        );
      return (
        (a = !0),
        d(),
        function () {
          re(p), c();
        }
      );
    });
  }
  function ai(t, e) {
    if (t instanceof RegExp) return { keys: !1, pattern: t };
    var r,
      n,
      i,
      s,
      l = [],
      a = "",
      o = t.split("/");
    for (o[0] || o.shift(); (i = o.shift()); )
      (r = i[0]),
        r === "*"
          ? (l.push("wild"), (a += "/(.*)"))
          : r === ":"
          ? ((n = i.indexOf("?", 1)),
            (s = i.indexOf(".", 1)),
            l.push(i.substring(1, ~n ? n : ~s ? s : i.length)),
            (a += !!~n && !~s ? "(?:/([^/]+?))?" : "/([^/]+?)"),
            ~s && (a += (~n ? "?" : "") + "\\" + i.substring(s)))
          : (a += "/" + i);
    return {
      keys: l,
      pattern: new RegExp("^" + a + (e ? "(?=$|/)" : "/?$"), "i"),
    };
  }
  function ci(t) {
    let e, r, n;
    const i = [t[2]];
    var s = t[0];
    function l(a) {
      let o = {};
      for (let u = 0; u < i.length; u += 1) o = ft(o, i[u]);
      return { props: o };
    }
    return (
      s && ((e = new s(l())), e.$on("routeEvent", t[7])),
      {
        c() {
          e && oe(e.$$.fragment), (r = _e());
        },
        m(a, o) {
          e && se(e, a, o), M(a, r, o), (n = !0);
        },
        p(a, o) {
          const u = o & 4 ? pn(i, [mn(a[2])]) : {};
          if (s !== (s = a[0])) {
            if (e) {
              G();
              const c = e;
              U(c.$$.fragment, 1, 0, () => {
                le(c, 1);
              }),
                Q();
            }
            s
              ? ((e = new s(l())),
                e.$on("routeEvent", a[7]),
                oe(e.$$.fragment),
                N(e.$$.fragment, 1),
                se(e, r.parentNode, r))
              : (e = null);
          } else s && e.$set(u);
        },
        i(a) {
          n || (e && N(e.$$.fragment, a), (n = !0));
        },
        o(a) {
          e && U(e.$$.fragment, a), (n = !1);
        },
        d(a) {
          a && j(r), e && le(e, a);
        },
      }
    );
  }
  function ui(t) {
    let e, r, n;
    const i = [{ params: t[1] }, t[2]];
    var s = t[0];
    function l(a) {
      let o = {};
      for (let u = 0; u < i.length; u += 1) o = ft(o, i[u]);
      return { props: o };
    }
    return (
      s && ((e = new s(l())), e.$on("routeEvent", t[6])),
      {
        c() {
          e && oe(e.$$.fragment), (r = _e());
        },
        m(a, o) {
          e && se(e, a, o), M(a, r, o), (n = !0);
        },
        p(a, o) {
          const u =
            o & 6 ? pn(i, [o & 2 && { params: a[1] }, o & 4 && mn(a[2])]) : {};
          if (s !== (s = a[0])) {
            if (e) {
              G();
              const c = e;
              U(c.$$.fragment, 1, 0, () => {
                le(c, 1);
              }),
                Q();
            }
            s
              ? ((e = new s(l())),
                e.$on("routeEvent", a[6]),
                oe(e.$$.fragment),
                N(e.$$.fragment, 1),
                se(e, r.parentNode, r))
              : (e = null);
          } else s && e.$set(u);
        },
        i(a) {
          n || (e && N(e.$$.fragment, a), (n = !0));
        },
        o(a) {
          e && U(e.$$.fragment, a), (n = !1);
        },
        d(a) {
          a && j(r), e && le(e, a);
        },
      }
    );
  }
  function fi(t) {
    let e, r, n, i;
    const s = [ui, ci],
      l = [];
    function a(o, u) {
      return o[1] ? 0 : 1;
    }
    return (
      (e = a(t)),
      (r = l[e] = s[e](t)),
      {
        c() {
          r.c(), (n = _e());
        },
        m(o, u) {
          l[e].m(o, u), M(o, n, u), (i = !0);
        },
        p(o, [u]) {
          let c = e;
          (e = a(o)),
            e === c
              ? l[e].p(o, u)
              : (G(),
                U(l[c], 1, 1, () => {
                  l[c] = null;
                }),
                Q(),
                (r = l[e]),
                r ? r.p(o, u) : ((r = l[e] = s[e](o)), r.c()),
                N(r, 1),
                r.m(n.parentNode, n));
        },
        i(o) {
          i || (N(r), (i = !0));
        },
        o(o) {
          U(r), (i = !1);
        },
        d(o) {
          l[e].d(o), o && j(n);
        },
      }
    );
  }
  function or() {
    const t = window.location.href.indexOf("#/");
    let e = t > -1 ? window.location.href.substr(t + 1) : "/";
    const r = e.indexOf("?");
    let n = "";
    return (
      r > -1 && ((n = e.substr(r + 1)), (e = e.substr(0, r))),
      { location: e, querystring: n }
    );
  }
  const Wt = hn(null, function (e) {
      e(or());
      const r = () => {
        e(or());
      };
      return (
        window.addEventListener("hashchange", r, !1),
        function () {
          window.removeEventListener("hashchange", r, !1);
        }
      );
    }),
    di = gn(Wt, (t) => t.location),
    pi = gn(Wt, (t) => t.querystring),
    ar = ye(void 0);
  async function Ge(t) {
    if (!t || t.length < 1 || (t.charAt(0) != "/" && t.indexOf("#/") !== 0))
      throw Error("Invalid parameter location");
    await an(),
      history.replaceState(
        {
          ...history.state,
          __svelte_spa_router_scrollX: window.scrollX,
          __svelte_spa_router_scrollY: window.scrollY,
        },
        void 0,
        void 0
      ),
      (window.location.hash = (t.charAt(0) == "#" ? "" : "#") + t);
  }
  function mi(t, e, r) {
    let { routes: n = {} } = e,
      { prefix: i = "" } = e,
      { restoreScrollState: s = !1 } = e;
    class l {
      constructor(S, v) {
        if (
          !v ||
          (typeof v != "function" &&
            (typeof v != "object" || v._sveltesparouter !== !0))
        )
          throw Error("Invalid component object");
        if (
          !S ||
          (typeof S == "string" &&
            (S.length < 1 || (S.charAt(0) != "/" && S.charAt(0) != "*"))) ||
          (typeof S == "object" && !(S instanceof RegExp))
        )
          throw Error(
            'Invalid value for "path" argument - strings must start with / or *'
          );
        const { pattern: $, keys: x } = ai(S);
        (this.path = S),
          typeof v == "object" && v._sveltesparouter === !0
            ? ((this.component = v.component),
              (this.conditions = v.conditions || []),
              (this.userData = v.userData),
              (this.props = v.props || {}))
            : ((this.component = () => Promise.resolve(v)),
              (this.conditions = []),
              (this.props = {})),
          (this._pattern = $),
          (this._keys = x);
      }
      match(S) {
        if (i) {
          if (typeof i == "string")
            if (S.startsWith(i)) S = S.substr(i.length) || "/";
            else return null;
          else if (i instanceof RegExp) {
            const D = S.match(i);
            if (D && D[0]) S = S.substr(D[0].length) || "/";
            else return null;
          }
        }
        const v = this._pattern.exec(S);
        if (v === null) return null;
        if (this._keys === !1) return v;
        const $ = {};
        let x = 0;
        for (; x < this._keys.length; ) {
          try {
            $[this._keys[x]] = decodeURIComponent(v[x + 1] || "") || null;
          } catch {
            $[this._keys[x]] = null;
          }
          x++;
        }
        return $;
      }
      async checkConditions(S) {
        for (let v = 0; v < this.conditions.length; v++)
          if (!(await this.conditions[v](S))) return !1;
        return !0;
      }
    }
    const a = [];
    n instanceof Map
      ? n.forEach((E, S) => {
          a.push(new l(S, E));
        })
      : Object.keys(n).forEach((E) => {
          a.push(new l(E, n[E]));
        });
    let o = null,
      u = null,
      c = {};
    const d = ri();
    async function p(E, S) {
      await an(), d(E, S);
    }
    let _ = null,
      m = null;
    s &&
      ((m = (E) => {
        E.state && E.state.__svelte_spa_router_scrollY
          ? (_ = E.state)
          : (_ = null);
      }),
      window.addEventListener("popstate", m),
      ti(() => {
        _
          ? window.scrollTo(
              _.__svelte_spa_router_scrollX,
              _.__svelte_spa_router_scrollY
            )
          : window.scrollTo(0, 0);
      }));
    let g = null,
      b = null;
    const k = Wt.subscribe(async (E) => {
      g = E;
      let S = 0;
      for (; S < a.length; ) {
        const v = a[S].match(E.location);
        if (!v) {
          S++;
          continue;
        }
        const $ = {
          route: a[S].path,
          location: E.location,
          querystring: E.querystring,
          userData: a[S].userData,
          params: v && typeof v == "object" && Object.keys(v).length ? v : null,
        };
        if (!(await a[S].checkConditions($))) {
          r(0, (o = null)), (b = null), p("conditionsFailed", $);
          return;
        }
        p("routeLoading", Object.assign({}, $));
        const x = a[S].component;
        if (b != x) {
          x.loading
            ? (r(0, (o = x.loading)),
              (b = x),
              r(1, (u = x.loadingParams)),
              r(2, (c = {})),
              p(
                "routeLoaded",
                Object.assign({}, $, { component: o, name: o.name, params: u })
              ))
            : (r(0, (o = null)), (b = null));
          const D = await x();
          if (E != g) return;
          r(0, (o = (D && D.default) || D)), (b = x);
        }
        v && typeof v == "object" && Object.keys(v).length
          ? r(1, (u = v))
          : r(1, (u = null)),
          r(2, (c = a[S].props)),
          p(
            "routeLoaded",
            Object.assign({}, $, { component: o, name: o.name, params: u })
          ).then(() => {
            ar.set(u);
          });
        return;
      }
      r(0, (o = null)), (b = null), ar.set(void 0);
    });
    Vt(() => {
      k(), m && window.removeEventListener("popstate", m);
    });
    function y(E) {
      Nt.call(this, t, E);
    }
    function T(E) {
      Nt.call(this, t, E);
    }
    return (
      (t.$$set = (E) => {
        "routes" in E && r(3, (n = E.routes)),
          "prefix" in E && r(4, (i = E.prefix)),
          "restoreScrollState" in E && r(5, (s = E.restoreScrollState));
      }),
      (t.$$.update = () => {
        t.$$.dirty & 32 && (history.scrollRestoration = s ? "manual" : "auto");
      }),
      [o, u, c, n, i, s, y, T]
    );
  }
  class hi extends de {
    constructor(e) {
      super(),
        fe(this, e, mi, fi, ne, { routes: 3, prefix: 4, restoreScrollState: 5 });
    }
  }
  function bn(t) {
    const e = t - 1;
    return e * e * e + 1;
  }
  function Qe(t, { delay: e = 0, duration: r = 400, easing: n = Ft } = {}) {
    const i = +getComputedStyle(t).opacity;
    return { delay: e, duration: r, easing: n, css: (s) => `opacity: ${s * i}` };
  }
  function ge(
    t,
    {
      delay: e = 0,
      duration: r = 400,
      easing: n = bn,
      x: i = 0,
      y: s = 0,
      opacity: l = 0,
    } = {}
  ) {
    const a = getComputedStyle(t),
      o = +a.opacity,
      u = a.transform === "none" ? "" : a.transform,
      c = o * (1 - l);
    return {
      delay: e,
      duration: r,
      easing: n,
      css: (d, p) => `
              transform: ${u} translate(${(1 - d) * i}px, ${(1 - d) * s}px);
              opacity: ${o - c * p}`,
    };
  }
  function cr(
    t,
    {
      delay: e = 0,
      duration: r = 400,
      easing: n = bn,
      start: i = 0,
      opacity: s = 0,
    } = {}
  ) {
    const l = getComputedStyle(t),
      a = +l.opacity,
      o = l.transform === "none" ? "" : l.transform,
      u = 1 - i,
      c = a * (1 - s);
    return {
      delay: e,
      duration: r,
      easing: n,
      css: (d, p) => `
              transform: ${o} scale(${1 - u * p});
              opacity: ${a - c * p}
          `,
    };
  }
  var Kt = { exports: {} },
    _n = function (e, r) {
      return function () {
        for (var i = new Array(arguments.length), s = 0; s < i.length; s++)
          i[s] = arguments[s];
        return e.apply(r, i);
      };
    },
    gi = _n,
    Yt = Object.prototype.toString,
    Xt = (function (t) {
      return function (e) {
        var r = Yt.call(e);
        return t[r] || (t[r] = r.slice(8, -1).toLowerCase());
      };
    })(Object.create(null));
  function Ae(t) {
    return (
      (t = t.toLowerCase()),
      function (r) {
        return Xt(r) === t;
      }
    );
  }
  function Gt(t) {
    return Array.isArray(t);
  }
  function mt(t) {
    return typeof t > "u";
  }
  function bi(t) {
    return (
      t !== null &&
      !mt(t) &&
      t.constructor !== null &&
      !mt(t.constructor) &&
      typeof t.constructor.isBuffer == "function" &&
      t.constructor.isBuffer(t)
    );
  }
  var wn = Ae("ArrayBuffer");
  function _i(t) {
    var e;
    return (
      typeof ArrayBuffer < "u" && ArrayBuffer.isView
        ? (e = ArrayBuffer.isView(t))
        : (e = t && t.buffer && wn(t.buffer)),
      e
    );
  }
  function wi(t) {
    return typeof t == "string";
  }
  function yi(t) {
    return typeof t == "number";
  }
  function yn(t) {
    return t !== null && typeof t == "object";
  }
  function at(t) {
    if (Xt(t) !== "object") return !1;
    var e = Object.getPrototypeOf(t);
    return e === null || e === Object.prototype;
  }
  var vi = Ae("Date"),
    ki = Ae("File"),
    xi = Ae("Blob"),
    Ei = Ae("FileList");
  function Qt(t) {
    return Yt.call(t) === "[object Function]";
  }
  function Si(t) {
    return yn(t) && Qt(t.pipe);
  }
  function Ci(t) {
    var e = "[object FormData]";
    return (
      t &&
      ((typeof FormData == "function" && t instanceof FormData) ||
        Yt.call(t) === e ||
        (Qt(t.toString) && t.toString() === e))
    );
  }
  var Oi = Ae("URLSearchParams");
  function Ri(t) {
    return t.trim ? t.trim() : t.replace(/^\s+|\s+$/g, "");
  }
  function Ai() {
    return typeof navigator < "u" &&
      (navigator.product === "ReactNative" ||
        navigator.product === "NativeScript" ||
        navigator.product === "NS")
      ? !1
      : typeof window < "u" && typeof document < "u";
  }
  function Zt(t, e) {
    if (!(t === null || typeof t > "u"))
      if ((typeof t != "object" && (t = [t]), Gt(t)))
        for (var r = 0, n = t.length; r < n; r++) e.call(null, t[r], r, t);
      else
        for (var i in t)
          Object.prototype.hasOwnProperty.call(t, i) && e.call(null, t[i], i, t);
  }
  function Dt() {
    var t = {};
    function e(i, s) {
      at(t[s]) && at(i)
        ? (t[s] = Dt(t[s], i))
        : at(i)
        ? (t[s] = Dt({}, i))
        : Gt(i)
        ? (t[s] = i.slice())
        : (t[s] = i);
    }
    for (var r = 0, n = arguments.length; r < n; r++) Zt(arguments[r], e);
    return t;
  }
  function Pi(t, e, r) {
    return (
      Zt(e, function (i, s) {
        r && typeof i == "function" ? (t[s] = gi(i, r)) : (t[s] = i);
      }),
      t
    );
  }
  function Ti(t) {
    return t.charCodeAt(0) === 65279 && (t = t.slice(1)), t;
  }
  function $i(t, e, r, n) {
    (t.prototype = Object.create(e.prototype, n)),
      (t.prototype.constructor = t),
      r && Object.assign(t.prototype, r);
  }
  function Li(t, e, r) {
    var n,
      i,
      s,
      l = {};
    e = e || {};
    do {
      for (n = Object.getOwnPropertyNames(t), i = n.length; i-- > 0; )
        (s = n[i]), l[s] || ((e[s] = t[s]), (l[s] = !0));
      t = Object.getPrototypeOf(t);
    } while (t && (!r || r(t, e)) && t !== Object.prototype);
    return e;
  }
  function Ni(t, e, r) {
    (t = String(t)),
      (r === void 0 || r > t.length) && (r = t.length),
      (r -= e.length);
    var n = t.indexOf(e, r);
    return n !== -1 && n === r;
  }
  function ji(t) {
    if (!t) return null;
    var e = t.length;
    if (mt(e)) return null;
    for (var r = new Array(e); e-- > 0; ) r[e] = t[e];
    return r;
  }
  var Mi = (function (t) {
      return function (e) {
        return t && e instanceof t;
      };
    })(typeof Uint8Array < "u" && Object.getPrototypeOf(Uint8Array)),
    ie = {
      isArray: Gt,
      isArrayBuffer: wn,
      isBuffer: bi,
      isFormData: Ci,
      isArrayBufferView: _i,
      isString: wi,
      isNumber: yi,
      isObject: yn,
      isPlainObject: at,
      isUndefined: mt,
      isDate: vi,
      isFile: ki,
      isBlob: xi,
      isFunction: Qt,
      isStream: Si,
      isURLSearchParams: Oi,
      isStandardBrowserEnv: Ai,
      forEach: Zt,
      merge: Dt,
      extend: Pi,
      trim: Ri,
      stripBOM: Ti,
      inherits: $i,
      toFlatObject: Li,
      kindOf: Xt,
      kindOfTest: Ae,
      endsWith: Ni,
      toArray: ji,
      isTypedArray: Mi,
      isFileList: Ei,
    },
    Te = ie;
  function ur(t) {
    return encodeURIComponent(t)
      .replace(/%3A/gi, ":")
      .replace(/%24/g, "$")
      .replace(/%2C/gi, ",")
      .replace(/%20/g, "+")
      .replace(/%5B/gi, "[")
      .replace(/%5D/gi, "]");
  }
  var vn = function (e, r, n) {
      if (!r) return e;
      var i;
      if (n) i = n(r);
      else if (Te.isURLSearchParams(r)) i = r.toString();
      else {
        var s = [];
        Te.forEach(r, function (o, u) {
          o === null ||
            typeof o > "u" ||
            (Te.isArray(o) ? (u = u + "[]") : (o = [o]),
            Te.forEach(o, function (d) {
              Te.isDate(d)
                ? (d = d.toISOString())
                : Te.isObject(d) && (d = JSON.stringify(d)),
                s.push(ur(u) + "=" + ur(d));
            }));
        }),
          (i = s.join("&"));
      }
      if (i) {
        var l = e.indexOf("#");
        l !== -1 && (e = e.slice(0, l)),
          (e += (e.indexOf("?") === -1 ? "?" : "&") + i);
      }
      return e;
    },
    Di = ie;
  function bt() {
    this.handlers = [];
  }
  bt.prototype.use = function (e, r, n) {
    return (
      this.handlers.push({
        fulfilled: e,
        rejected: r,
        synchronous: n ? n.synchronous : !1,
        runWhen: n ? n.runWhen : null,
      }),
      this.handlers.length - 1
    );
  };
  bt.prototype.eject = function (e) {
    this.handlers[e] && (this.handlers[e] = null);
  };
  bt.prototype.forEach = function (e) {
    Di.forEach(this.handlers, function (n) {
      n !== null && e(n);
    });
  };
  var zi = bt,
    Bi = ie,
    Ui = function (e, r) {
      Bi.forEach(e, function (i, s) {
        s !== r &&
          s.toUpperCase() === r.toUpperCase() &&
          ((e[r] = i), delete e[s]);
      });
    },
    kn = ie;
  function De(t, e, r, n, i) {
    Error.call(this),
      (this.message = t),
      (this.name = "AxiosError"),
      e && (this.code = e),
      r && (this.config = r),
      n && (this.request = n),
      i && (this.response = i);
  }
  kn.inherits(De, Error, {
    toJSON: function () {
      return {
        message: this.message,
        name: this.name,
        description: this.description,
        number: this.number,
        fileName: this.fileName,
        lineNumber: this.lineNumber,
        columnNumber: this.columnNumber,
        stack: this.stack,
        config: this.config,
        code: this.code,
        status:
          this.response && this.response.status ? this.response.status : null,
      };
    },
  });
  var xn = De.prototype,
    En = {};
  [
    "ERR_BAD_OPTION_VALUE",
    "ERR_BAD_OPTION",
    "ECONNABORTED",
    "ETIMEDOUT",
    "ERR_NETWORK",
    "ERR_FR_TOO_MANY_REDIRECTS",
    "ERR_DEPRECATED",
    "ERR_BAD_RESPONSE",
    "ERR_BAD_REQUEST",
    "ERR_CANCELED",
  ].forEach(function (t) {
    En[t] = { value: t };
  });
  Object.defineProperties(De, En);
  Object.defineProperty(xn, "isAxiosError", { value: !0 });
  De.from = function (t, e, r, n, i, s) {
    var l = Object.create(xn);
    return (
      kn.toFlatObject(t, l, function (o) {
        return o !== Error.prototype;
      }),
      De.call(l, t.message, e, r, n, i),
      (l.name = t.name),
      s && Object.assign(l, s),
      l
    );
  };
  var Fe = De,
    Sn = {
      silentJSONParsing: !0,
      forcedJSONParsing: !0,
      clarifyTimeoutError: !1,
    },
    be = ie;
  function Ii(t, e) {
    e = e || new FormData();
    var r = [];
    function n(s) {
      return s === null
        ? ""
        : be.isDate(s)
        ? s.toISOString()
        : be.isArrayBuffer(s) || be.isTypedArray(s)
        ? typeof Blob == "function"
          ? new Blob([s])
          : Buffer.from(s)
        : s;
    }
    function i(s, l) {
      if (be.isPlainObject(s) || be.isArray(s)) {
        if (r.indexOf(s) !== -1)
          throw Error("Circular reference detected in " + l);
        r.push(s),
          be.forEach(s, function (o, u) {
            if (!be.isUndefined(o)) {
              var c = l ? l + "." + u : u,
                d;
              if (o && !l && typeof o == "object") {
                if (be.endsWith(u, "{}")) o = JSON.stringify(o);
                else if (be.endsWith(u, "[]") && (d = be.toArray(o))) {
                  d.forEach(function (p) {
                    !be.isUndefined(p) && e.append(c, n(p));
                  });
                  return;
                }
              }
              i(o, c);
            }
          }),
          r.pop();
      } else e.append(l, n(s));
    }
    return i(t), e;
  }
  var Cn = Ii,
    Ct = Fe,
    Fi = function (e, r, n) {
      var i = n.config.validateStatus;
      !n.status || !i || i(n.status)
        ? e(n)
        : r(
            new Ct(
              "Request failed with status code " + n.status,
              [Ct.ERR_BAD_REQUEST, Ct.ERR_BAD_RESPONSE][
                Math.floor(n.status / 100) - 4
              ],
              n.config,
              n.request,
              n
            )
          );
    },
    st = ie,
    Hi = st.isStandardBrowserEnv()
      ? (function () {
          return {
            write: function (r, n, i, s, l, a) {
              var o = [];
              o.push(r + "=" + encodeURIComponent(n)),
                st.isNumber(i) && o.push("expires=" + new Date(i).toGMTString()),
                st.isString(s) && o.push("path=" + s),
                st.isString(l) && o.push("domain=" + l),
                a === !0 && o.push("secure"),
                (document.cookie = o.join("; "));
            },
            read: function (r) {
              var n = document.cookie.match(
                new RegExp("(^|;\\s*)(" + r + ")=([^;]*)")
              );
              return n ? decodeURIComponent(n[3]) : null;
            },
            remove: function (r) {
              this.write(r, "", Date.now() - 864e5);
            },
          };
        })()
      : (function () {
          return {
            write: function () {},
            read: function () {
              return null;
            },
            remove: function () {},
          };
        })(),
    qi = function (e) {
      return /^([a-z][a-z\d+\-.]*:)?\/\//i.test(e);
    },
    Vi = function (e, r) {
      return r ? e.replace(/\/+$/, "") + "/" + r.replace(/^\/+/, "") : e;
    },
    Ji = qi,
    Wi = Vi,
    On = function (e, r) {
      return e && !Ji(r) ? Wi(e, r) : r;
    },
    Ot = ie,
    Ki = [
      "age",
      "authorization",
      "content-length",
      "content-type",
      "etag",
      "expires",
      "from",
      "host",
      "if-modified-since",
      "if-unmodified-since",
      "last-modified",
      "location",
      "max-forwards",
      "proxy-authorization",
      "referer",
      "retry-after",
      "user-agent",
    ],
    Yi = function (e) {
      var r = {},
        n,
        i,
        s;
      return (
        e &&
          Ot.forEach(
            e.split(`
  `),
            function (a) {
              if (
                ((s = a.indexOf(":")),
                (n = Ot.trim(a.substr(0, s)).toLowerCase()),
                (i = Ot.trim(a.substr(s + 1))),
                n)
              ) {
                if (r[n] && Ki.indexOf(n) >= 0) return;
                n === "set-cookie"
                  ? (r[n] = (r[n] ? r[n] : []).concat([i]))
                  : (r[n] = r[n] ? r[n] + ", " + i : i);
              }
            }
          ),
        r
      );
    },
    fr = ie,
    Xi = fr.isStandardBrowserEnv()
      ? (function () {
          var e = /(msie|trident)/i.test(navigator.userAgent),
            r = document.createElement("a"),
            n;
          function i(s) {
            var l = s;
            return (
              e && (r.setAttribute("href", l), (l = r.href)),
              r.setAttribute("href", l),
              {
                href: r.href,
                protocol: r.protocol ? r.protocol.replace(/:$/, "") : "",
                host: r.host,
                search: r.search ? r.search.replace(/^\?/, "") : "",
                hash: r.hash ? r.hash.replace(/^#/, "") : "",
                hostname: r.hostname,
                port: r.port,
                pathname:
                  r.pathname.charAt(0) === "/" ? r.pathname : "/" + r.pathname,
              }
            );
          }
          return (
            (n = i(window.location.href)),
            function (l) {
              var a = fr.isString(l) ? i(l) : l;
              return a.protocol === n.protocol && a.host === n.host;
            }
          );
        })()
      : (function () {
          return function () {
            return !0;
          };
        })(),
    zt = Fe,
    Gi = ie;
  function Rn(t) {
    zt.call(this, t ?? "canceled", zt.ERR_CANCELED),
      (this.name = "CanceledError");
  }
  Gi.inherits(Rn, zt, { __CANCEL__: !0 });
  var _t = Rn,
    Qi = function (e) {
      var r = /^([-+\w]{1,25})(:?\/\/|:)/.exec(e);
      return (r && r[1]) || "";
    },
    Ve = ie,
    Zi = Fi,
    es = Hi,
    ts = vn,
    rs = On,
    ns = Yi,
    is = Xi,
    ss = Sn,
    ve = Fe,
    ls = _t,
    os = Qi,
    dr = function (e) {
      return new Promise(function (n, i) {
        var s = e.data,
          l = e.headers,
          a = e.responseType,
          o;
        function u() {
          e.cancelToken && e.cancelToken.unsubscribe(o),
            e.signal && e.signal.removeEventListener("abort", o);
        }
        Ve.isFormData(s) && Ve.isStandardBrowserEnv() && delete l["Content-Type"];
        var c = new XMLHttpRequest();
        if (e.auth) {
          var d = e.auth.username || "",
            p = e.auth.password
              ? unescape(encodeURIComponent(e.auth.password))
              : "";
          l.Authorization = "Basic " + btoa(d + ":" + p);
        }
        var _ = rs(e.baseURL, e.url);
        c.open(e.method.toUpperCase(), ts(_, e.params, e.paramsSerializer), !0),
          (c.timeout = e.timeout);
        function m() {
          if (!!c) {
            var k =
                "getAllResponseHeaders" in c
                  ? ns(c.getAllResponseHeaders())
                  : null,
              y =
                !a || a === "text" || a === "json" ? c.responseText : c.response,
              T = {
                data: y,
                status: c.status,
                statusText: c.statusText,
                headers: k,
                config: e,
                request: c,
              };
            Zi(
              function (S) {
                n(S), u();
              },
              function (S) {
                i(S), u();
              },
              T
            ),
              (c = null);
          }
        }
        if (
          ("onloadend" in c
            ? (c.onloadend = m)
            : (c.onreadystatechange = function () {
                !c ||
                  c.readyState !== 4 ||
                  (c.status === 0 &&
                    !(c.responseURL && c.responseURL.indexOf("file:") === 0)) ||
                  setTimeout(m);
              }),
          (c.onabort = function () {
            !c ||
              (i(new ve("Request aborted", ve.ECONNABORTED, e, c)), (c = null));
          }),
          (c.onerror = function () {
            i(new ve("Network Error", ve.ERR_NETWORK, e, c, c)), (c = null);
          }),
          (c.ontimeout = function () {
            var y = e.timeout
                ? "timeout of " + e.timeout + "ms exceeded"
                : "timeout exceeded",
              T = e.transitional || ss;
            e.timeoutErrorMessage && (y = e.timeoutErrorMessage),
              i(
                new ve(
                  y,
                  T.clarifyTimeoutError ? ve.ETIMEDOUT : ve.ECONNABORTED,
                  e,
                  c
                )
              ),
              (c = null);
          }),
          Ve.isStandardBrowserEnv())
        ) {
          var g =
            (e.withCredentials || is(_)) && e.xsrfCookieName
              ? es.read(e.xsrfCookieName)
              : void 0;
          g && (l[e.xsrfHeaderName] = g);
        }
        "setRequestHeader" in c &&
          Ve.forEach(l, function (y, T) {
            typeof s > "u" && T.toLowerCase() === "content-type"
              ? delete l[T]
              : c.setRequestHeader(T, y);
          }),
          Ve.isUndefined(e.withCredentials) ||
            (c.withCredentials = !!e.withCredentials),
          a && a !== "json" && (c.responseType = e.responseType),
          typeof e.onDownloadProgress == "function" &&
            c.addEventListener("progress", e.onDownloadProgress),
          typeof e.onUploadProgress == "function" &&
            c.upload &&
            c.upload.addEventListener("progress", e.onUploadProgress),
          (e.cancelToken || e.signal) &&
            ((o = function (k) {
              !c ||
                (i(!k || (k && k.type) ? new ls() : k), c.abort(), (c = null));
            }),
            e.cancelToken && e.cancelToken.subscribe(o),
            e.signal &&
              (e.signal.aborted ? o() : e.signal.addEventListener("abort", o))),
          s || (s = null);
        var b = os(_);
        if (b && ["http", "https", "file"].indexOf(b) === -1) {
          i(new ve("Unsupported protocol " + b + ":", ve.ERR_BAD_REQUEST, e));
          return;
        }
        c.send(s);
      });
    },
    as = null,
    Z = ie,
    pr = Ui,
    mr = Fe,
    cs = Sn,
    us = Cn,
    fs = { "Content-Type": "application/x-www-form-urlencoded" };
  function hr(t, e) {
    !Z.isUndefined(t) &&
      Z.isUndefined(t["Content-Type"]) &&
      (t["Content-Type"] = e);
  }
  function ds() {
    var t;
    return (
      (typeof XMLHttpRequest < "u" ||
        (typeof process < "u" &&
          Object.prototype.toString.call(process) === "[object process]")) &&
        (t = dr),
      t
    );
  }
  function ps(t, e, r) {
    if (Z.isString(t))
      try {
        return (e || JSON.parse)(t), Z.trim(t);
      } catch (n) {
        if (n.name !== "SyntaxError") throw n;
      }
    return (r || JSON.stringify)(t);
  }
  var wt = {
    transitional: cs,
    adapter: ds(),
    transformRequest: [
      function (e, r) {
        if (
          (pr(r, "Accept"),
          pr(r, "Content-Type"),
          Z.isFormData(e) ||
            Z.isArrayBuffer(e) ||
            Z.isBuffer(e) ||
            Z.isStream(e) ||
            Z.isFile(e) ||
            Z.isBlob(e))
        )
          return e;
        if (Z.isArrayBufferView(e)) return e.buffer;
        if (Z.isURLSearchParams(e))
          return (
            hr(r, "application/x-www-form-urlencoded;charset=utf-8"), e.toString()
          );
        var n = Z.isObject(e),
          i = r && r["Content-Type"],
          s;
        if ((s = Z.isFileList(e)) || (n && i === "multipart/form-data")) {
          var l = this.env && this.env.FormData;
          return us(s ? { "files[]": e } : e, l && new l());
        } else if (n || i === "application/json")
          return hr(r, "application/json"), ps(e);
        return e;
      },
    ],
    transformResponse: [
      function (e) {
        var r = this.transitional || wt.transitional,
          n = r && r.silentJSONParsing,
          i = r && r.forcedJSONParsing,
          s = !n && this.responseType === "json";
        if (s || (i && Z.isString(e) && e.length))
          try {
            return JSON.parse(e);
          } catch (l) {
            if (s)
              throw l.name === "SyntaxError"
                ? mr.from(l, mr.ERR_BAD_RESPONSE, this, null, this.response)
                : l;
          }
        return e;
      },
    ],
    timeout: 0,
    xsrfCookieName: "XSRF-TOKEN",
    xsrfHeaderName: "X-XSRF-TOKEN",
    maxContentLength: -1,
    maxBodyLength: -1,
    env: { FormData: as },
    validateStatus: function (e) {
      return e >= 200 && e < 300;
    },
    headers: { common: { Accept: "application/json, text/plain, */*" } },
  };
  Z.forEach(["delete", "get", "head"], function (e) {
    wt.headers[e] = {};
  });
  Z.forEach(["post", "put", "patch"], function (e) {
    wt.headers[e] = Z.merge(fs);
  });
  var er = wt,
    ms = ie,
    hs = er,
    gs = function (e, r, n) {
      var i = this || hs;
      return (
        ms.forEach(n, function (l) {
          e = l.call(i, e, r);
        }),
        e
      );
    },
    An = function (e) {
      return !!(e && e.__CANCEL__);
    },
    gr = ie,
    Rt = gs,
    bs = An,
    _s = er,
    ws = _t;
  function At(t) {
    if (
      (t.cancelToken && t.cancelToken.throwIfRequested(),
      t.signal && t.signal.aborted)
    )
      throw new ws();
  }
  var ys = function (e) {
      At(e),
        (e.headers = e.headers || {}),
        (e.data = Rt.call(e, e.data, e.headers, e.transformRequest)),
        (e.headers = gr.merge(
          e.headers.common || {},
          e.headers[e.method] || {},
          e.headers
        )),
        gr.forEach(
          ["delete", "get", "head", "post", "put", "patch", "common"],
          function (i) {
            delete e.headers[i];
          }
        );
      var r = e.adapter || _s.adapter;
      return r(e).then(
        function (i) {
          return (
            At(e),
            (i.data = Rt.call(e, i.data, i.headers, e.transformResponse)),
            i
          );
        },
        function (i) {
          return (
            bs(i) ||
              (At(e),
              i &&
                i.response &&
                (i.response.data = Rt.call(
                  e,
                  i.response.data,
                  i.response.headers,
                  e.transformResponse
                ))),
            Promise.reject(i)
          );
        }
      );
    },
    ue = ie,
    Pn = function (e, r) {
      r = r || {};
      var n = {};
      function i(c, d) {
        return ue.isPlainObject(c) && ue.isPlainObject(d)
          ? ue.merge(c, d)
          : ue.isPlainObject(d)
          ? ue.merge({}, d)
          : ue.isArray(d)
          ? d.slice()
          : d;
      }
      function s(c) {
        if (ue.isUndefined(r[c])) {
          if (!ue.isUndefined(e[c])) return i(void 0, e[c]);
        } else return i(e[c], r[c]);
      }
      function l(c) {
        if (!ue.isUndefined(r[c])) return i(void 0, r[c]);
      }
      function a(c) {
        if (ue.isUndefined(r[c])) {
          if (!ue.isUndefined(e[c])) return i(void 0, e[c]);
        } else return i(void 0, r[c]);
      }
      function o(c) {
        if (c in r) return i(e[c], r[c]);
        if (c in e) return i(void 0, e[c]);
      }
      var u = {
        url: l,
        method: l,
        data: l,
        baseURL: a,
        transformRequest: a,
        transformResponse: a,
        paramsSerializer: a,
        timeout: a,
        timeoutMessage: a,
        withCredentials: a,
        adapter: a,
        responseType: a,
        xsrfCookieName: a,
        xsrfHeaderName: a,
        onUploadProgress: a,
        onDownloadProgress: a,
        decompress: a,
        maxContentLength: a,
        maxBodyLength: a,
        beforeRedirect: a,
        transport: a,
        httpAgent: a,
        httpsAgent: a,
        cancelToken: a,
        socketPath: a,
        responseEncoding: a,
        validateStatus: o,
      };
      return (
        ue.forEach(Object.keys(e).concat(Object.keys(r)), function (d) {
          var p = u[d] || s,
            _ = p(d);
          (ue.isUndefined(_) && p !== o) || (n[d] = _);
        }),
        n
      );
    },
    Tn = { version: "0.27.2" },
    vs = Tn.version,
    Ce = Fe,
    tr = {};
  ["object", "boolean", "number", "function", "string", "symbol"].forEach(
    function (t, e) {
      tr[t] = function (n) {
        return typeof n === t || "a" + (e < 1 ? "n " : " ") + t;
      };
    }
  );
  var br = {};
  tr.transitional = function (e, r, n) {
    function i(s, l) {
      return (
        "[Axios v" +
        vs +
        "] Transitional option '" +
        s +
        "'" +
        l +
        (n ? ". " + n : "")
      );
    }
    return function (s, l, a) {
      if (e === !1)
        throw new Ce(
          i(l, " has been removed" + (r ? " in " + r : "")),
          Ce.ERR_DEPRECATED
        );
      return (
        r &&
          !br[l] &&
          ((br[l] = !0),
          console.warn(
            i(
              l,
              " has been deprecated since v" +
                r +
                " and will be removed in the near future"
            )
          )),
        e ? e(s, l, a) : !0
      );
    };
  };
  function ks(t, e, r) {
    if (typeof t != "object")
      throw new Ce("options must be an object", Ce.ERR_BAD_OPTION_VALUE);
    for (var n = Object.keys(t), i = n.length; i-- > 0; ) {
      var s = n[i],
        l = e[s];
      if (l) {
        var a = t[s],
          o = a === void 0 || l(a, s, t);
        if (o !== !0)
          throw new Ce("option " + s + " must be " + o, Ce.ERR_BAD_OPTION_VALUE);
        continue;
      }
      if (r !== !0) throw new Ce("Unknown option " + s, Ce.ERR_BAD_OPTION);
    }
  }
  var xs = { assertOptions: ks, validators: tr },
    $n = ie,
    Es = vn,
    _r = zi,
    wr = ys,
    yt = Pn,
    Ss = On,
    Ln = xs,
    $e = Ln.validators;
  function ze(t) {
    (this.defaults = t),
      (this.interceptors = { request: new _r(), response: new _r() });
  }
  ze.prototype.request = function (e, r) {
    typeof e == "string" ? ((r = r || {}), (r.url = e)) : (r = e || {}),
      (r = yt(this.defaults, r)),
      r.method
        ? (r.method = r.method.toLowerCase())
        : this.defaults.method
        ? (r.method = this.defaults.method.toLowerCase())
        : (r.method = "get");
    var n = r.transitional;
    n !== void 0 &&
      Ln.assertOptions(
        n,
        {
          silentJSONParsing: $e.transitional($e.boolean),
          forcedJSONParsing: $e.transitional($e.boolean),
          clarifyTimeoutError: $e.transitional($e.boolean),
        },
        !1
      );
    var i = [],
      s = !0;
    this.interceptors.request.forEach(function (_) {
      (typeof _.runWhen == "function" && _.runWhen(r) === !1) ||
        ((s = s && _.synchronous), i.unshift(_.fulfilled, _.rejected));
    });
    var l = [];
    this.interceptors.response.forEach(function (_) {
      l.push(_.fulfilled, _.rejected);
    });
    var a;
    if (!s) {
      var o = [wr, void 0];
      for (
        Array.prototype.unshift.apply(o, i),
          o = o.concat(l),
          a = Promise.resolve(r);
        o.length;
  
      )
        a = a.then(o.shift(), o.shift());
      return a;
    }
    for (var u = r; i.length; ) {
      var c = i.shift(),
        d = i.shift();
      try {
        u = c(u);
      } catch (p) {
        d(p);
        break;
      }
    }
    try {
      a = wr(u);
    } catch (p) {
      return Promise.reject(p);
    }
    for (; l.length; ) a = a.then(l.shift(), l.shift());
    return a;
  };
  ze.prototype.getUri = function (e) {
    e = yt(this.defaults, e);
    var r = Ss(e.baseURL, e.url);
    return Es(r, e.params, e.paramsSerializer);
  };
  $n.forEach(["delete", "get", "head", "options"], function (e) {
    ze.prototype[e] = function (r, n) {
      return this.request(
        yt(n || {}, { method: e, url: r, data: (n || {}).data })
      );
    };
  });
  $n.forEach(["post", "put", "patch"], function (e) {
    function r(n) {
      return function (s, l, a) {
        return this.request(
          yt(a || {}, {
            method: e,
            headers: n ? { "Content-Type": "multipart/form-data" } : {},
            url: s,
            data: l,
          })
        );
      };
    }
    (ze.prototype[e] = r()), (ze.prototype[e + "Form"] = r(!0));
  });
  var Cs = ze,
    Os = _t;
  function Be(t) {
    if (typeof t != "function")
      throw new TypeError("executor must be a function.");
    var e;
    this.promise = new Promise(function (i) {
      e = i;
    });
    var r = this;
    this.promise.then(function (n) {
      if (!!r._listeners) {
        var i,
          s = r._listeners.length;
        for (i = 0; i < s; i++) r._listeners[i](n);
        r._listeners = null;
      }
    }),
      (this.promise.then = function (n) {
        var i,
          s = new Promise(function (l) {
            r.subscribe(l), (i = l);
          }).then(n);
        return (
          (s.cancel = function () {
            r.unsubscribe(i);
          }),
          s
        );
      }),
      t(function (i) {
        r.reason || ((r.reason = new Os(i)), e(r.reason));
      });
  }
  Be.prototype.throwIfRequested = function () {
    if (this.reason) throw this.reason;
  };
  Be.prototype.subscribe = function (e) {
    if (this.reason) {
      e(this.reason);
      return;
    }
    this._listeners ? this._listeners.push(e) : (this._listeners = [e]);
  };
  Be.prototype.unsubscribe = function (e) {
    if (!!this._listeners) {
      var r = this._listeners.indexOf(e);
      r !== -1 && this._listeners.splice(r, 1);
    }
  };
  Be.source = function () {
    var e,
      r = new Be(function (i) {
        e = i;
      });
    return { token: r, cancel: e };
  };
  var Rs = Be,
    As = function (e) {
      return function (n) {
        return e.apply(null, n);
      };
    },
    Ps = ie,
    Ts = function (e) {
      return Ps.isObject(e) && e.isAxiosError === !0;
    },
    yr = ie,
    $s = _n,
    ct = Cs,
    Ls = Pn,
    Ns = er;
  function Nn(t) {
    var e = new ct(t),
      r = $s(ct.prototype.request, e);
    return (
      yr.extend(r, ct.prototype, e),
      yr.extend(r, e),
      (r.create = function (i) {
        return Nn(Ls(t, i));
      }),
      r
    );
  }
  var ce = Nn(Ns);
  ce.Axios = ct;
  ce.CanceledError = _t;
  ce.CancelToken = Rs;
  ce.isCancel = An;
  ce.VERSION = Tn.version;
  ce.toFormData = Cn;
  ce.AxiosError = Fe;
  ce.Cancel = ce.CanceledError;
  ce.all = function (e) {
    return Promise.all(e);
  };
  ce.spread = As;
  ce.isAxiosError = Ts;
  Kt.exports = ce;
  Kt.exports.default = ce;
  var js = Kt.exports;
  function Ms(t) {
    let e = t.length,
      r;
    for (; e != 0; )
      (r = Math.floor(Math.random() * e)), e--, ([t[e], t[r]] = [t[r], t[e]]);
    return t;
  }
  function vt(t) {
    return new Promise((e) => setTimeout(e, t));
  }
  function Ds(t, e, r) {
    return r.indexOf(t) == e;
  }
  let Pt = !1;
  async function vr(t) {
    for (; Pt; ) await vt(50);
    try {
      (Pt = !0), await t();
    } finally {
      Pt = !1;
    }
  }
  const Bt = ye(),
    W = ye(),
    We = ye(),
    Re = ye(),
    Ee = ye(),
    ut = ye(!1);
  function He(t, e = "[]", r = !0) {
    const n = ye(JSON.parse(localStorage.getItem(t) ?? e));
    return (
      r && n.subscribe((i) => localStorage.setItem(t, JSON.stringify(i))),
      (n.save = function (i) {
        localStorage.setItem(t, JSON.stringify(i ?? pe(this)));
      }),
      n
    );
  }
  async function je(t) {
    for (; pe(ut); ) await vt(50);
    ut.set(!0);
    try {
      t instanceof Promise ? await t : await t();
    } finally {
      ut.set(!1);
    }
  }
  const Ze = He("isMuted", !1),
    ht = He("volume", 50),
    jn = He("localVolume", 100),
    Oe = He("lastPlayed", '"migrated"', !1),
    me = He("likes", '"migrated"', !1),
    we = He("playlists", '"migrated"', !1),
    X = js.create({ baseURL: "http://104.234.63.139:3000/client", headers: {} });
  async function zs([t, e]) {
    (X.defaults.headers.authorization = t),
      (X.defaults.headers["x-player-id"] = e);
  }
  function Bs(t) {
    return he(() => X.post("playlists", t));
  }
  function Us(t) {
    return he(() => X.delete(`playlists/${t}`));
  }
  function Is(t) {
    return pe(me).includes(t);
  }
  function Mn(t) {
    return rr(t, !Is(t));
  }
  function rr(t, e = !0) {
    const r = `likes/${t}`;
    return e
      ? (me.update((n) => [t, ...n].filter(Ds)), X.post(r))
      : (!e &&
          pe(Re)?.type === "LIKES" &&
          Re.update((n) => ((n.songs = n.songs.filter((i) => i != t)), n)),
        me.update((n) => n.filter((i) => i != t)),
        X.delete(r));
  }
  function kt(t, e) {
    return he(() => X.post("history", { type: t, id: e })).then(
      (r) => (Oe.set(r.data.last_played), r)
    );
  }
  function Fs(t, e) {
    Oe.update((r) => {
      const n = r.filter((i) => i.type != t || i.id != e);
      return Hs(n), n;
    });
  }
  function Hs(t) {
    return Oe.set(t), he(() => X.put("history", { last_played: t }));
  }
  function qs(t) {
    return X.get("search", { params: { title: t } });
  }
  const Tt = {};
  async function Dn(t) {
    if (t.length) {
      if (t.every((e) => e in Tt)) {
        const e = t.map((r) => Tt[r]);
        return { status: 200, data: e };
      }
    } else return { status: 200, data: [] };
    return X.get("playlist", { params: { songs: t.join(",") } }).then(
      (e) => (e.data.forEach((r) => (Tt[r._id] = r)), e)
    );
  }
  function kr(t, e = 0) {
    const r = t.songs.slice(e, e + 30);
    return Dn(r).then((n) => {
      const i = n.data.map((l) => l._id),
        s = r.filter((l) => !i.includes(l));
      return (
        s.length > 0 &&
          ((t.songs = t.songs.filter((l) => !s.includes(l))),
          s.forEach((l) => rr(l, !1))),
        n
      );
    });
  }
  function Vs(t) {
    return X.post("download", { songs: t });
  }
  function Js(t) {
    return typeof t == "object" && (t = t._id), X.post(t + "/download");
  }
  async function he(t, e = 3) {
    let r = [];
    for (let n = 0; n < e; n += 1)
      try {
        return await t();
      } catch (i) {
        i?.response && r.push(i.response.status + ":" + i.response.data?.message),
          await vt(3e3);
      }
    throw new Error(
      `Attempt to request ${e} times, but none succeeded, [${r.join(", ")}]`
    );
  }
  const Ue = {},
    xt = ye({ x: 0, y: 0, z: 0, interior: 0 });
  let Ke = null,
    zn = 0.5;
  const Bn = [0, 0];
  J("getBaseVolume").then((t) => {
    zn = t;
  });
  let Un;
  function In(t) {
    Un = t;
  }
  let Ut = 0;
  async function rt(t = [], e = !1) {
    if (t.length === 0)
      return Ee.set("N\xE3o \xE9 poss\xEDvel tocar uma playlist vazia.");
    const r = {};
    try {
      await Vs(t.slice(0, 2)).then((a) => {
        Object.assign(r, Object.fromEntries(a.data.map((o) => [o._id, o])));
      });
    } catch (a) {
      return (
        a.response
          ? console.error("HTTP Error: " + a.response.status)
          : console.error("Error without response"),
        Ee.set(
          "N\xE3o foi poss\xEDvel tocar esta m\xFAsica, se o problema persistir, contate o suporte."
        )
      );
    }
    Ze.set(!1);
    let n = t.shift();
    e && t.push(n);
    const i = pe(W);
    let s = "radio";
    const l = r[n];
    if (Ke && i?.mode == "dj" && (await J("server", "next", l.url))) s = "dj";
    else if (i != null && !Ke && (await J("server", "next", l.url))) s = i.mode;
    else {
      const a = await J("getVehicle"),
        { mode: o, error: u } = await (Ke
          ? await J("server", "play_dj", Ke - 1, l.url, pe(ht) / 100)
          : await J("server", "play", a, l.url, pe(ht) / 100));
      if (u) return Ee.set(u);
      s = o;
    }
    W.set({ ...l, mode: s, played_at: Ie(), paused_at: void 0 }),
      Bt.set(),
      In((a) => {
        if (a === Ut) {
          if (((n = t.shift()), e)) t.push(n);
          else if (!n) {
            (Ut = 0), W.set();
            return;
          }
          const o = r[n];
          t[0] &&
            he(() => Js(t[0])).then(({ data: c }) => {
              r[c._id] = c;
            });
          const u = pe(W);
          J("server", "next", o.url).then((c) => {
            !c || W.set({ ...o, mode: u.mode, played_at: Ie() });
          });
        }
      });
  }
  function Fn(t) {
    const e = pe(xt),
      r = Math.sqrt((e.x - t.x) ** 2 + (e.y - t.y) ** 2 + (e.z - t.z) ** 2);
    let n = t.inWater ? t.range / 4 : t.range;
    if (
      (t.interior != e.interior && (n /= 3),
      t.isStuffy && (n /= 4),
      r >= n || e.interior === "blocked" || t.paused_at || pe(Ze))
    )
      return t.audio.pause();
    t.audio.paused &&
      (t.audio.play().catch(() => {}),
      (t.audio.currentTime = (Ie() - t.created_at) / 1e3));
    let i = Math.min(1, Math.max(0, (1 - r / n) * 1.25));
    t.inWater && (i /= 8),
      t.isStuffy && (i /= 4),
      t.interior != e.interior && (i /= 8),
      (t.audio.volume = i * zn * Math.min(1, t.volume) * (pe(jn) / 100));
  }
  function Ws() {
    Object.values(Ue).forEach(Fn);
  }
  function Ks(t) {
    jn.set(Math.max(1, Math.min(100, t)));
  }
  function Ys(t) {
    const e = Ue[t.id];
    if (e) return Object.assign(e, t);
    t.isCurrent && (Ut = t.id),
      (t.audio = new Audio(t.url)),
      t.audio.addEventListener("ended", () => Un?.(t.id), { once: !0 }),
      Fn(t),
      (Ue[t.id] = t);
  }
  function Xs(t) {
    Ze.set(t);
  }
  function Gs() {
    W.set();
  }
  function Qs(t) {
    const e = Ue[t];
    e && (e.audio.pause(), delete Ue[t]);
  }
  function Zs(t, e) {
    const r = Ue[t];
    r && Object.assign(r, e);
  }
  function el(t, e, r, n) {
    xt.update((i) => Object.assign(i, { x: t, y: e, z: r, interior: n }));
  }
  J("server", "getTimer").then((t) => {
    Object.assign(Bn, [t, Date.now()]);
  });
  function Ie() {
    const [t, e] = Bn;
    return t + (Date.now() - e);
  }
  function tl() {
    Ee.set("Emparelhamento encerrado: dispositivo fora de alcance."), W.set();
  }
  function It(t) {
    Ke = t;
  }
  function rl() {
    pe(W) && (J("server", "stop"), W.set());
  }
  var nl = Object.freeze(
    Object.defineProperty(
      {
        __proto__: null,
        player: xt,
        onSongEnd: In,
        startQueue: rt,
        refresh: Ws,
        updateVolume: Ks,
        setSound: Ys,
        toggleMute: Xs,
        clearCurrent: Gs,
        removeSound: Qs,
        updateSound: Zs,
        setPosition: el,
        getGameTimer: Ie,
        onMaxDistance: tl,
        setDJ: It,
        onPlayerDie: rl,
      },
      Symbol.toStringTag,
      { value: "Module" }
    )
  );
  function J(t, ...e) {
    const r = window.GetParentResourceName?.();
    return fetch(`http://${r}/${t}`, {
      method: "POST",
      body: JSON.stringify(e),
    }).then((n) => n.json());
  }
  const et = {};
  Object.assign(et, nl);
  window.onmessage = ({ data: t }) => {
    if (!Array.isArray(t)) return;
    const e = t.shift();
    e in et && et[e](...t);
  };
  function il(t) {
    let e, r, n;
    return {
      c() {
        (e = w("div")),
          (r = w("i")),
          h(r, "class", "fas fa-heart"),
          h(
            e,
            "class",
            (n =
              "w-12 h-12 bg-gradient-to-br " +
              t[0].class +
              " from-[#4131F4] to-[#C3F0D8] grid-center")
          );
      },
      m(i, s) {
        M(i, e, s), f(e, r);
      },
      p(i, [s]) {
        s & 1 &&
          n !==
            (n =
              "w-12 h-12 bg-gradient-to-br " +
              i[0].class +
              " from-[#4131F4] to-[#C3F0D8] grid-center") &&
          h(e, "class", n);
      },
      i: F,
      o: F,
      d(i) {
        i && j(e);
      },
    };
  }
  function sl(t, e, r) {
    return (
      (t.$$set = (n) => {
        r(0, (e = ft(ft({}, e), ir(n))));
      }),
      (e = ir(e)),
      [e]
    );
  }
  class Et extends de {
    constructor(e) {
      super(), fe(this, e, sl, il, ne, {});
    }
  }
  function ll(t) {
    let e, r, n;
    return {
      c() {
        (e = w("div")),
          (e.innerHTML =
            '<i class="fal fa-spinner-third text-5xl animate-spin"></i>'),
          h(
            e,
            "class",
            "absolute inset-0 grid place-items-center bg-black/50 z-10"
          );
      },
      m(i, s) {
        M(i, e, s), (n = !0);
      },
      p: F,
      i(i) {
        n ||
          (ae(() => {
            r || (r = ee(e, Qe, {}, !0)), r.run(1);
          }),
          (n = !0));
      },
      o(i) {
        r || (r = ee(e, Qe, {}, !1)), r.run(0), (n = !1);
      },
      d(i) {
        i && j(e), i && r && r.end();
      },
    };
  }
  class ol extends de {
    constructor(e) {
      super(), fe(this, e, null, ll, ne, {});
    }
  }
  function xr(t, e, r) {
    const n = t.slice();
    return (n[13] = e[r]), n;
  }
  function Er(t, e, r) {
    const n = t.slice();
    return (n[16] = e[r]), n;
  }
  function Sr(t) {
    let e;
    return {
      c() {
        (e = w("p")),
          (e.textContent =
            "Na \xE1rea em que voc\xEA se encontra, n\xE3o \xE9 poss\xEDvel tocar ou escutar m\xFAsicas."),
          h(e, "class", "bg-red-600/50 text-red-300 p-4 rounded-xl mb-5");
      },
      m(r, n) {
        M(r, e, n);
      },
      d(r) {
        r && j(e);
      },
    };
  }
  function Cr(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a = t[16].name + "",
      o,
      u,
      c;
    return {
      c() {
        (e = w("a")),
          (r = w("li")),
          (n = w("img")),
          (s = R()),
          (l = w("h1")),
          (o = V(a)),
          (u = R()),
          Y(
            n.src,
            (i = t[16].image_url ?? "https://picsum.photos/200?v=" + t[16]._id)
          ) || h(n, "src", i),
          h(n, "alt", ""),
          h(n, "class", "w-12 h-12 rounded flex-shrink-0"),
          h(l, "class", "overflow-ellipsis overflow-hidden"),
          h(r, "class", "flex items-center space-x-3"),
          h(e, "href", (c = "#/playlists/" + t[16]._id));
      },
      m(d, p) {
        M(d, e, p), f(e, r), f(r, n), f(r, s), f(r, l), f(l, o), f(e, u);
      },
      p(d, p) {
        p & 2 &&
          !Y(
            n.src,
            (i = d[16].image_url ?? "https://picsum.photos/200?v=" + d[16]._id)
          ) &&
          h(n, "src", i),
          p & 2 && a !== (a = d[16].name + "") && te(o, a),
          p & 2 && c !== (c = "#/playlists/" + d[16]._id) && h(e, "href", c);
      },
      d(d) {
        d && j(e);
      },
    };
  }
  function al(t) {
    return { c: F, m: F, p: F, i: F, o: F, d: F };
  }
  function cl(t) {
    let e, r, n, i;
    const s = [fl, ul],
      l = [];
    function a(o, u) {
      return o[6].length ? 0 : 1;
    }
    return (
      (e = a(t)),
      (r = l[e] = s[e](t)),
      {
        c() {
          r.c(), (n = _e());
        },
        m(o, u) {
          l[e].m(o, u), M(o, n, u), (i = !0);
        },
        p(o, u) {
          let c = e;
          (e = a(o)),
            e === c
              ? l[e].p(o, u)
              : (G(),
                U(l[c], 1, 1, () => {
                  l[c] = null;
                }),
                Q(),
                (r = l[e]),
                r ? r.p(o, u) : ((r = l[e] = s[e](o)), r.c()),
                N(r, 1),
                r.m(n.parentNode, n));
        },
        i(o) {
          i || (N(r), (i = !0));
        },
        o(o) {
          U(r), (i = !1);
        },
        d(o) {
          l[e].d(o), o && j(n);
        },
      }
    );
  }
  function ul(t) {
    let e;
    return {
      c() {
        (e = w("div")),
          (e.innerHTML = '<i class="fal fa-history text-8xl opacity-25"></i>'),
          h(e, "class", "text-center");
      },
      m(r, n) {
        M(r, e, n);
      },
      p: F,
      i: F,
      o: F,
      d(r) {
        r && j(e);
      },
    };
  }
  function fl(t) {
    let e,
      r,
      n = t[6],
      i = [];
    for (let l = 0; l < n.length; l += 1) i[l] = Or(xr(t, n, l));
    const s = (l) =>
      U(i[l], 1, 1, () => {
        i[l] = null;
      });
    return {
      c() {
        e = w("ul");
        for (let l = 0; l < i.length; l += 1) i[l].c();
        h(e, "class", "grid gap-3 grid-cols-2 text-sm");
      },
      m(l, a) {
        M(l, e, a);
        for (let o = 0; o < i.length; o += 1) i[o].m(e, null);
        r = !0;
      },
      p(l, a) {
        if (a & 240) {
          n = l[6];
          let o;
          for (o = 0; o < n.length; o += 1) {
            const u = xr(l, n, o);
            i[o]
              ? (i[o].p(u, a), N(i[o], 1))
              : ((i[o] = Or(u)), i[o].c(), N(i[o], 1), i[o].m(e, null));
          }
          for (G(), o = n.length; o < i.length; o += 1) s(o);
          Q();
        }
      },
      i(l) {
        if (!r) {
          for (let a = 0; a < n.length; a += 1) N(i[a]);
          r = !0;
        }
      },
      o(l) {
        i = i.filter(Boolean);
        for (let a = 0; a < i.length; a += 1) U(i[a]);
        r = !1;
      },
      d(l) {
        l && j(e), gt(i, l);
      },
    };
  }
  function dl(t) {
    let e, r;
    return {
      c() {
        (e = w("img")),
          Y(e.src, (r = t[13].embed.image_url)) || h(e, "src", r),
          h(e, "alt", ""),
          h(e, "class", "w-12 h-12 rounded flex-shrink-0");
      },
      m(n, i) {
        M(n, e, i);
      },
      p(n, i) {
        i & 64 && !Y(e.src, (r = n[13].embed.image_url)) && h(e, "src", r);
      },
      i: F,
      o: F,
      d(n) {
        n && j(e);
      },
    };
  }
  function pl(t) {
    let e, r;
    return (
      (e = new Et({ props: { class: "rounded flex-shrink-0" } })),
      {
        c() {
          oe(e.$$.fragment);
        },
        m(n, i) {
          se(e, n, i), (r = !0);
        },
        p: F,
        i(n) {
          r || (N(e.$$.fragment, n), (r = !0));
        },
        o(n) {
          U(e.$$.fragment, n), (r = !1);
        },
        d(n) {
          le(e, n);
        },
      }
    );
  }
  function Or(t) {
    let e,
      r,
      n,
      i,
      s,
      l = t[13].embed.name + "",
      a,
      o,
      u,
      c,
      d,
      p;
    const _ = [pl, dl],
      m = [];
    function g(b, k) {
      return b[13].embed._id === "liked" ? 0 : 1;
    }
    return (
      (r = g(t)),
      (n = m[r] = _[r](t)),
      {
        c() {
          (e = w("li")),
            n.c(),
            (i = R()),
            (s = w("h1")),
            (a = V(l)),
            (u = R()),
            h(
              s,
              "class",
              (o =
                "overflow-ellipsis overflow-hidden " +
                ((t[4]?._id == t[13].id || t[5]?._id == t[13].id) &&
                  "text-spotify"))
            ),
            h(e, "class", "flex items-center space-x-3");
        },
        m(b, k) {
          M(b, e, k),
            m[r].m(e, null),
            f(e, i),
            f(e, s),
            f(s, a),
            f(e, u),
            (c = !0),
            d ||
              ((p = H(e, "click", function () {
                Se(t[7].bind(t[13])) && t[7].bind(t[13]).apply(this, arguments);
              })),
              (d = !0));
        },
        p(b, k) {
          t = b;
          let y = r;
          (r = g(t)),
            r === y
              ? m[r].p(t, k)
              : (G(),
                U(m[y], 1, 1, () => {
                  m[y] = null;
                }),
                Q(),
                (n = m[r]),
                n ? n.p(t, k) : ((n = m[r] = _[r](t)), n.c()),
                N(n, 1),
                n.m(e, i)),
            (!c || k & 64) && l !== (l = t[13].embed.name + "") && te(a, l),
            (!c ||
              (k & 112 &&
                o !==
                  (o =
                    "overflow-ellipsis overflow-hidden " +
                    ((t[4]?._id == t[13].id || t[5]?._id == t[13].id) &&
                      "text-spotify")))) &&
              h(s, "class", o);
        },
        i(b) {
          c || (N(n), (c = !0));
        },
        o(b) {
          U(n), (c = !1);
        },
        d(b) {
          b && j(e), m[r].d(), (d = !1), p();
        },
      }
    );
  }
  function ml(t) {
    let e;
    return {
      c() {
        (e = w("div")),
          (e.innerHTML =
            '<i class="fas fa-spinner-third animate-spin text-4xl"></i>'),
          h(e, "class", "grid-center h-32");
      },
      m(r, n) {
        M(r, e, n);
      },
      p: F,
      i: F,
      o: F,
      d(r) {
        r && j(e);
      },
    };
  }
  function hl(t) {
    let e, r, n, i, s, l, a, o, u, c, d, p, _, m, g, b, k, y, T, E, S, v, $, x, D, I, O = t[2].interior === "blocked" && Sr();
    g = new Et({
        props: {
            class: "rounded"
        }
    });
    let P = t[1].slice(0, 5),
        z = [];
    for (let L = 0; L < P.length; L += 1) z[L] = Cr(Er(t, P, L));
    let C = {
        ctx: t,
        current: null,
        token: null,
        hasCatch: !1,
        pending: ml,
        then: cl,
        catch: al,
        value: 6,
        blocks: [, , , ]
    };
    return lr($ = t[6], C), {
        // c() {
        //     e = w("div"), O && O.c(), r = R(), n = w("div"), i = w("h1"), s = V(t[0]), l = R(), a = w("button"), o = w("i"), c = R(), d = w("div"), p = w("ul"), _ = w("a"), m = w("li"), oe(g.$$.fragment), b = R(), k = w("h1"), k.textContent = "M\xFAsicas Curtidas", y = R();
        //     for (let L = 0; L < z.length; L += 1) z[L].c();
        //     T = R(), E = w("div"), S = w("h1"), S.textContent = "Musicas sugeridas", v = R(), C.block.c(), h(i, "class", "text-2xl font-bold"), h(o, "class", u = "fal w-6 " + (t[3] ? "fa-volume-slash" : "fa-volume")), h(n, "class", "flex justify-between"), h(m, "class", "flex items-center space-x-3"), h(_, "href", "#/playlists/liked"), h(p, "class", "grid gap-3 grid-cols-2 text-sm"), h(d, "class", "mt-5"), h(S, "class", "text-2xl font-bold mb-5"), h(E, "class", "mt-5"), h(e, "class", "p-5 pt-6 h-full overflow-y-auto pb-24"), Gn(e, "background-image", "linear-gradient(170deg, rgba(67, 56, 202, 0.8), #0f0f0f 20%)")
        // },
  
        c() {
            e = w("div"), O && O.c(), r = R(), n = w("div"), i = w("h1"), s = V(t[0]), l = R(), a = w("button"), o = w("i"), c = R(), d = w("div"), p = w("ul"), _ = w("a"), m = w("li"), oe(g.$$.fragment), b = R(), k = w("h1"), k.textContent = "M\xFAsicas Curtidas", y = R();
            for (let L = 0; L < z.length; L += 1) z[L].c();
            T = R(), E = w("div"), S = w("h1"), S.textContent = "Musicas sugeridas", v = R(), C.block.c(), h(i, "class", "text-2xl font-bold"), h(o, "class", u = "fal w-6 " + (t[3] ? "fa-volume-slash" : "fa-volume")), h(n, "class", "flex justify-between"), h(m, "class", "flex items-center space-x-3"), h(_, "href", "#/playlists/liked"), h(p, "class", "grid gap-3 grid-cols-2 text-sm"), h(d, "class", "mt-5"), h(S, "class", "text-2xl font-bold mb-5"), h(E, "class", "mt-5"), h(e, "class", "p-5 pt-6 h-full overflow-y-auto pb-24"), Gn(e, "background-image", "linear-gradient(170deg, rgba(67, 56, 202, 0.8), #0f0f0f 20%)")
        
            // Adiciona margem superior para mover a parte do código para baixo
            // Gn(e, "margin-top", "50px"); // Ajuste o valor conforme necessário
            // Define a imagem de fundo para o elemento div
            Gn(e, "background-image", "url(http://104.234.63.139/1x1.png)"); // Substitua pela URL real da sua imagem
        
            // Outros estilos de imagem de fundo (opcional)
            Gn(e, "background-size", "contain"); // Ajusta o tamanho da imagem de fundo para cobrir todo o elemento
            Gn(e, "background-repeat", "no-repeat"); // Impede a repetição da imagem de fundo
        
            // Configura a posição e o tamanho da imagem de fundo
            Gn(e, "background-position", "80px -25px"); // Define a posição da imagem de fundo (horizontal: 100px, vertical: 50px)
            Gn(e, "background-size", "210px 180px"); // Define o tamanho da imagem de fundo (largura: 200px, altura: 150px)
        },
  
        // c() {
        //     e = w("div"), O && O.c(), r = R(), n = w("div"), i = w("h1"), s = V(t[0]), l = R(), a = w("button"), o = w("i"), c = R(), d = w("div"), p = w("ul"), _ = w("a"), m = w("li"), oe(g.$$.fragment), b = R(), k = w("h1"), k.textContent = "M\xFAsicas Curtidas", y = R();
        //     for (let L = 0; L < z.length; L += 1) z[L].c();
        //     T = R(), E = w("div"), S = w("h1"), S.textContent = "Musicas sugeridas", v = R(), C.block.c(), h(i, "class", "text-2xl font-bold"), h(o, "class", u = "fal w-6 " + (t[3] ? "fa-volume-slash" : "fa-volume")), h(n, "class", "flex justify-between"), h(m, "class", "flex items-center space-x-3"), h(_, "href", "#/playlists/liked"), h(p, "class", "grid gap-3 grid-cols-2 text-sm"), h(d, "class", "mt-5"), h(S, "class", "text-2xl font-bold mb-5"), h(E, "class", "mt-5"), h(e, "class", "p-5 pt-6 h-full overflow-y-auto pb-24");
        
        //     // Mantém a imagem de fundo original e adiciona a imagem
        //     Gn(e, "margin-top", "0px"); // Ajuste o valor conforme necessário
        //     Gn(e, "background-image", "linear-gradient(170deg, rgba(67, 56, 202, 0.58), #0f0f0f 20%), url(https://media.discordapp.net/attachments/1090141782886600772/1217351358248783912/front_bumper.png?ex=660cf04d&is=65fa7b4d&hm=e2ed2827672535ebc1d8c7ec310d19636517b167c0b8c066a5a9ddf0f457b4a0&=&format=webp&quality=lossless)");
        //     // Define outras propriedades de estilo de imagem de fundo
        //     Gn(e, "background-size", "contain, 210px 180px"); // Ajusta o tamanho da imagem de fundo para caber dentro do elemento
        //     Gn(e, "background-repeat", "no-repeat"); // Impede a repetição da imagem de fundo
        //     Gn(e, "background-position", "center, 80px -25px"); // Centraliza a imagem de fundo
        // },
        
        
        m(L, B) {
            M(L, e, B), O && O.m(e, null), f(e, r), f(e, n), f(n, i), f(i, s), f(n, l), f(n, a), f(a, o), f(e, c), f(e, d), f(d, p), f(p, _), f(_, m), se(g, m, null), f(m, b), f(m, k), f(p, y);
            for (let A = 0; A < z.length; A += 1) z[A].m(p, null);
            f(e, T), f(e, E), f(E, S), f(E, v), C.block.m(E, C.anchor = null), C.mount = () => E, C.anchor = null, x = !0, D || (I = H(a, "click", t[9]), D = !0)
        },
        p(L, [B]) {
            if (t = L, t[2].interior === "blocked" ? O || (O = Sr(), O.c(), O.m(e, r)) : O && (O.d(1), O = null), (!x || B & 1) && te(s, t[0]), (!x || B & 8 && u !== (u = "fal w-6 " + (t[3] ? "fa-volume-slash" : "fa-volume"))) && h(o, "class", u), B & 2) {
                P = t[1].slice(0, 5);
                let A;
                for (A = 0; A < P.length; A += 1) {
                    const K = Er(t, P, A);
                    z[A] ? z[A].p(K, B) : (z[A] = Cr(K), z[A].c(), z[A].m(p, null))
                }
                for (; A < z.length; A += 1) z[A].d(1);
                z.length = P.length
            }
            C.ctx = t, B & 64 && $ !== ($ = t[6]) && lr($, C) || si(C, t, B)
        },
        i(L) {
            x || (N(g.$$.fragment, L), N(C.block), x = !0)
        },
        o(L) {
            U(g.$$.fragment, L);
            for (let B = 0; B < 3; B += 1) {
                const A = C.blocks[B];
                U(A)
            }
            x = !1
        },
        d(L) {
            L && j(e), O && O.d(), le(g), gt(z, L), C.block.d(), C.token = null, C = null, D = !1, I()
        }
    }
  }function gl(t, e, r) {
    let n, i, s, l, a, o, u, c;
    q(t, Oe, (b) => r(8, (i = b))),
      q(t, me, (b) => r(10, (s = b))),
      q(t, we, (b) => r(1, (l = b))),
      q(t, xt, (b) => r(2, (a = b))),
      q(t, Ze, (b) => r(3, (o = b))),
      q(t, W, (b) => r(4, (u = b))),
      q(t, Bt, (b) => r(5, (c = b)));
    const d = new Date();
    let p = "";
    d.getHours() >= 12 && d.getHours() <= 18
      ? (p = "")
      : (d.getHours() < 5 || d.getHours() > 18) && (p = "");
    async function _(b) {
      const k = await Dn(b.filter((y) => y.type === "SONG").map((y) => y.id));
      return b
        .map(
          (y) => (
            y.type === "PLAYLIST"
              ? (y.embed = l.find((T) => T._id == y.id) ?? {
                  _id: "liked",
                  name: "M\xFAsicas Curtidas",
                  songs: s,
                })
              : ((y.embed = k.data.find((T) => T._id == y.id)),
                y.embed &&
                  (y.embed.name = y.embed.name.replace(/\(.+\)/, "").trim())),
            y
          )
        )
        .filter((y) => y.embed);
    }
    function m() {
      const b = this.type === "PLAYLIST" ? this.embed.songs.slice() : [this.id];
      je(async () => {
        await kt(this.type, this.id),
          await rt(b),
          Bt.set(this.type === "PLAYLIST" ? this.embed : null);
      });
    }
    const g = () => Ze.set(!o);
    return (
      (t.$$.update = () => {
        t.$$.dirty & 256 && r(6, (n = _(JSON.parse(JSON.stringify(i)))));
      }),
      [p, l, a, o, u, c, n, m, i, g]
    );
  }
  class bl extends de {
    constructor(e) {
      super(), fe(this, e, gl, hl, ne, {});
    }
  }
  function Rr(t) {
    let e;
    return {
      c() {
        (e = w("span")),
          (e.textContent = "E"),
          h(e, "class", "bg-white/50 rounded px-1 text-xs text-white/75");
      },
      m(r, n) {
        M(r, e, n);
      },
      d(r) {
        r && j(e);
      },
    };
  }
  function _l(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a = t[0].name + "",
      o,
      u,
      c,
      d,
      p,
      _,
      m = t[0].author + "",
      g,
      b,
      k,
      y,
      T,
      E = t[0].is_explicit && Rr();
    return {
      c() {
        (e = w("li")),
          (r = w("img")),
          (i = R()),
          (s = w("div")),
          (l = w("h1")),
          (u = R()),
          (c = w("div")),
          E && E.c(),
          (d = R()),
          (p = w("h3")),
          (_ = V("M\xFAsica \u2022 ")),
          (g = V(m)),
          (b = R()),
          (k = w("button")),
          (k.innerHTML = '<i class="fal fa-ellipsis-v"></i>'),
          Y(r.src, (n = t[0].image_url)) || h(r, "src", n),
          h(r, "class", "w-12"),
          h(r, "alt", ""),
          h(
            l,
            "class",
            (o = "text-base whitespace-nowrap " + (t[1] && "text-spotify"))
          ),
          h(p, "class", "text-white/50"),
          h(c, "class", "flex space-x-2 items-center"),
          h(s, "class", "flex flex-col flex-1 overflow-hidden ml-4"),
          h(k, "class", "ml-2 p-1 opacity-50"),
          h(e, "class", "flex items-start");
      },
      m(S, v) {
        M(S, e, v),
          f(e, r),
          f(e, i),
          f(e, s),
          f(s, l),
          (l.innerHTML = a),
          f(s, u),
          f(s, c),
          E && E.m(c, null),
          f(c, d),
          f(c, p),
          f(p, _),
          f(p, g),
          f(e, b),
          f(e, k),
          y || ((T = [H(k, "click", t[4]), H(e, "click", t[3])]), (y = !0));
      },
      p(S, [v]) {
        v & 1 && !Y(r.src, (n = S[0].image_url)) && h(r, "src", n),
          v & 1 && a !== (a = S[0].name + "") && (l.innerHTML = a),
          v & 2 &&
            o !==
              (o = "text-base whitespace-nowrap " + (S[1] && "text-spotify")) &&
            h(l, "class", o),
          S[0].is_explicit
            ? E || ((E = Rr()), E.c(), E.m(c, d))
            : E && (E.d(1), (E = null)),
          v & 1 && m !== (m = S[0].author + "") && te(g, m);
      },
      i: F,
      o: F,
      d(S) {
        S && j(e), E && E.d(), (y = !1), re(T);
      },
    };
  }
  function wl(t, e, r) {
    let n, i;
    q(t, W, (o) => r(2, (i = o)));
    let { song: s } = e;
    function l(o) {
      Nt.call(this, t, o);
    }
    const a = (o) => {
      o.stopPropagation(), We.set(s);
    };
    return (
      (t.$$set = (o) => {
        "song" in o && r(0, (s = o.song));
      }),
      (t.$$.update = () => {
        t.$$.dirty & 5 && r(1, (n = i?._id == s._id));
      }),
      [s, n, i, l, a]
    );
  }
  class Hn extends de {
    constructor(e) {
      super(), fe(this, e, wl, _l, ne, { song: 0 });
    }
  }
  function Ar(t, e, r) {
    const n = t.slice();
    return (n[6] = e[r]), n;
  }
  function Pr(t) {
    let e,
      r = [],
      n = new Map(),
      i,
      s = t[1];
    const l = (a) => a[6]._id;
    for (let a = 0; a < s.length; a += 1) {
      let o = Ar(t, s, a),
        u = l(o);
      n.set(u, (r[a] = Tr(u, o)));
    }
    return {
      c() {
        e = w("ul");
        for (let a = 0; a < r.length; a += 1) r[a].c();
        h(e, "class", "space-y-5 p-5 flex-1 overflow-y-auto pb-40");
      },
      m(a, o) {
        M(a, e, o);
        for (let u = 0; u < r.length; u += 1) r[u].m(e, null);
        i = !0;
      },
      p(a, o) {
        o & 10 &&
          ((s = a[1]),
          G(),
          (r = dn(r, o, l, 1, a, s, n, e, fn, Tr, null, Ar)),
          Q());
      },
      i(a) {
        if (!i) {
          for (let o = 0; o < s.length; o += 1) N(r[o]);
          i = !0;
        }
      },
      o(a) {
        for (let o = 0; o < r.length; o += 1) U(r[o]);
        i = !1;
      },
      d(a) {
        a && j(e);
        for (let o = 0; o < r.length; o += 1) r[o].d();
      },
    };
  }
  function Tr(t, e) {
    let r, n, i;
    return (
      (n = new Hn({ props: { song: e[6] } })),
      n.$on("click", function () {
        Se(e[3].bind(e[6]._id)) && e[3].bind(e[6]._id).apply(this, arguments);
      }),
      {
        key: t,
        first: null,
        c() {
          (r = _e()), oe(n.$$.fragment), (this.first = r);
        },
        m(s, l) {
          M(s, r, l), se(n, s, l), (i = !0);
        },
        p(s, l) {
          e = s;
          const a = {};
          l & 2 && (a.song = e[6]), n.$set(a);
        },
        i(s) {
          i || (N(n.$$.fragment, s), (i = !0));
        },
        o(s) {
          U(n.$$.fragment, s), (i = !1);
        },
        d(s) {
          s && j(r), le(n, s);
        },
      }
    );
  }
  function yl(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a,
      o,
      u,
      c,
      d,
      p,
      _ = t[1] && Pr(t);
    return {
      c() {
        (e = w("div")),
          (r = w("h1")),
          (r.textContent = "Buscar"),
          (n = R()),
          (i = w("div")),
          (s = w("i")),
          (l = R()),
          (a = w("input")),
          (o = R()),
          _ && _.c(),
          (u = _e()),
          h(r, "class", "text-4xl mb-5"),
          h(s, "class", "fal fa-search absolute left-3 top-3"),
          h(
            a,
            "class",
            "w-full bg-neutral-800 text-base p-2 pl-10 rounded placeholder:text-white/50"
          ),
          h(a, "placeholder", "Artistas, m\xFAsicas, ou podcasts"),
          h(i, "class", "relative"),
          h(e, "class", "p-5 pt-12");
      },
      m(m, g) {
        M(m, e, g),
          f(e, r),
          f(e, n),
          f(e, i),
          f(i, s),
          f(i, l),
          f(i, a),
          Me(a, t[0]),
          M(m, o, g),
          _ && _.m(m, g),
          M(m, u, g),
          (c = !0),
          d || ((p = [H(a, "input", t[4]), H(a, "keydown", t[2])]), (d = !0));
      },
      p(m, [g]) {
        g & 1 && a.value !== m[0] && Me(a, m[0]),
          m[1]
            ? _
              ? (_.p(m, g), g & 2 && N(_, 1))
              : ((_ = Pr(m)), _.c(), N(_, 1), _.m(u.parentNode, u))
            : _ &&
              (G(),
              U(_, 1, 1, () => {
                _ = null;
              }),
              Q());
      },
      i(m) {
        c || (N(_), (c = !0));
      },
      o(m) {
        U(_), (c = !1);
      },
      d(m) {
        m && j(e), m && j(o), _ && _.d(m), m && j(u), (d = !1), re(p);
      },
    };
  }
  function vl(t, e, r) {
    let n = "",
      i,
      s = [];
    function l({ key: u }) {
      if (!(u !== "Enter" && u !== "[auto]")) {
        if ((clearTimeout(i), u === "[auto]"))
          return (i = setTimeout(() => {
            l({ key: "Enter" });
          }, 2500));
        if (!n.trim()) return r(1, (s = []));
        je(
          qs(n).then((c) => {
            r(1, (s = c.data));
          })
        );
      }
    }
    Vt(() => clearTimeout(i));
    function a() {
      je(async () => {
        await kt("SONG", this);
        const u = s.map((c) => c._id);
        for (; u[0] != this; ) u.push(u.shift());
        await rt(u);
      });
    }
    function o() {
      (n = this.value), r(0, n);
    }
    return (
      (t.$$.update = () => {
        t.$$.dirty & 1 && n && l({ key: "[auto]" });
      }),
      [n, s, l, a, o]
    );
  }
  class kl extends de {
    constructor(e) {
      super(), fe(this, e, vl, yl, ne, {});
    }
  }
  function $r(t, e, r) {
    const n = t.slice();
    return (n[3] = e[r]), n;
  }
  function xl(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a,
      o = t[0].name + "",
      u,
      c,
      d,
      p,
      _,
      m,
      g,
      b,
      k,
      y,
      T,
      E,
      S,
      v,
      $,
      x,
      D,
      I,
      O,
      P,
      z;
    return {
      c() {
        (e = w("div")),
          (r = w("div")),
          (n = w("button")),
          (n.innerHTML = '<i class="fas fa-arrow-left"></i>'),
          (i = R()),
          (s = w("h1")),
          (s.textContent = "Playlist"),
          (l = R()),
          (a = w("h1")),
          (u = V(o)),
          (c = R()),
          (d = w("img")),
          (_ = R()),
          (m = w("ul")),
          (g = w("li")),
          (g.innerHTML = `<i class="far fa-play mr-4 opacity-50"></i>
          Tocar esta Playlist`),
          (b = R()),
          (k = w("a")),
          (y = w("li")),
          (y.innerHTML = `<i class="fal fa-music mr-4 opacity-50"></i>
            Ver esta Playlist`),
          (E = R()),
          (S = w("a")),
          (v = w("li")),
          (v.innerHTML = `<i class="fal fa-pen-alt mr-4 opacity-50"></i>
            Editar esta Playlist`),
          (x = R()),
          (D = w("li")),
          (D.innerHTML = `<i class="far fa-minus-circle mr-4 opacity-50"></i>
          Excluir esta Playlist`),
          h(n, "class", "opacity-50"),
          h(s, "class", "absolute inset-x-20 font-bold text-center"),
          h(r, "class", "absolute top-5 inset-x-5 flex"),
          h(d, "class", "w-32 h-32 mt-4 rounded"),
          Y(d.src, (p = t[0].image_url)) || h(d, "src", p),
          h(d, "alt", ""),
          h(k, "href", (T = "#/playlists/" + t[0]._id)),
          h(S, "href", ($ = "#/playlists/" + t[0]._id + "?action=edit")),
          h(
            m,
            "class",
            "flex flex-col w-full space-y-3 mt-5 px-10 overflow-y-auto"
          ),
          h(
            e,
            "class",
            "absolute inset-0 bg-black z-20 pt-12 flex flex-col items-center"
          );
      },
      m(C, L) {
        M(C, e, L),
          f(e, r),
          f(r, n),
          f(r, i),
          f(r, s),
          f(e, l),
          f(e, a),
          f(a, u),
          f(e, c),
          f(e, d),
          f(e, _),
          f(e, m),
          f(m, g),
          f(m, b),
          f(m, k),
          f(k, y),
          f(m, E),
          f(m, S),
          f(S, v),
          f(m, x),
          f(m, D),
          (O = !0),
          P ||
            ((z = [
              H(n, "click", t[9]),
              H(g, "click", t[5]),
              H(D, "click", t[6]),
            ]),
            (P = !0));
      },
      p(C, L) {
        (!O || L & 1) && o !== (o = C[0].name + "") && te(u, o),
          (!O || (L & 1 && !Y(d.src, (p = C[0].image_url)))) && h(d, "src", p),
          (!O || (L & 1 && T !== (T = "#/playlists/" + C[0]._id))) &&
            h(k, "href", T),
          (!O ||
            (L & 1 && $ !== ($ = "#/playlists/" + C[0]._id + "?action=edit"))) &&
            h(S, "href", $);
      },
      i(C) {
        O ||
          (C &&
            ae(() => {
              I || (I = ee(e, ge, { y: 300, duration: 500 }, !0)), I.run(1);
            }),
          (O = !0));
      },
      o(C) {
        C && (I || (I = ee(e, ge, { y: 300, duration: 500 }, !1)), I.run(0)),
          (O = !1);
      },
      d(C) {
        C && j(e), C && I && I.end(), (P = !1), re(z);
      },
    };
  }
  function El(t) {
    let e, r, n, i, s, l, a, o, u, c, d, p, _, m;
    return {
      c() {
        (e = w("div")),
          (r = w("h1")),
          (r.textContent = "D\xEA um nome para sua playlist."),
          (n = R()),
          (i = w("div")),
          (s = w("input")),
          (l = R()),
          (a = w("div")),
          (o = w("button")),
          (o.textContent = "CANCELAR"),
          (u = R()),
          (c = w("button")),
          (c.textContent = "CRIAR"),
          h(r, "class", "font-bold"),
          h(
            s,
            "class",
            "border-b-[0.5px] border-black w-full py-1 underline text-2xl bg-transparent text-center"
          ),
          h(i, "class", "w-64 mt-4"),
          h(o, "class", "text-neutral-400"),
          h(c, "class", "text-spotify"),
          h(a, "class", "flex justify-around w-48 text-xs mt-8"),
          h(
            e,
            "class",
            "absolute inset-0 bg-gradient-to-b from-neutral-500 to-black z-10 pt-32 flex flex-col items-center"
          );
      },
      m(g, b) {
        M(g, e, b),
          f(e, r),
          f(e, n),
          f(e, i),
          f(i, s),
          Me(s, t[3].name),
          f(e, l),
          f(e, a),
          f(a, o),
          f(a, u),
          f(a, c),
          (p = !0),
          _ ||
            ((m = [
              H(s, "input", t[7]),
              H(o, "click", t[8]),
              H(c, "click", t[4]),
            ]),
            (_ = !0));
      },
      p(g, b) {
        b & 8 && s.value !== g[3].name && Me(s, g[3].name);
      },
      i(g) {
        p ||
          (ae(() => {
            d || (d = ee(e, ge, { x: 300, duration: 500 }, !0)), d.run(1);
          }),
          (p = !0));
      },
      o(g) {
        d || (d = ee(e, ge, { x: 300, duration: 500 }, !1)), d.run(0), (p = !1);
      },
      d(g) {
        g && j(e), g && d && d.end(), (_ = !1), re(m);
      },
    };
  }
  function Lr(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a = t[3].name + "",
      o,
      u,
      c,
      d,
      p = t[3].songs.length + "",
      _,
      m,
      g,
      b,
      k,
      y,
      T;
    function E(...S) {
      return t[11](t[3], ...S);
    }
    return {
      c() {
        (e = w("li")),
          (r = w("img")),
          (i = R()),
          (s = w("div")),
          (l = w("h1")),
          (o = V(a)),
          (u = R()),
          (c = w("p")),
          (d = V("Playlist \u2022 ")),
          (_ = V(p)),
          (m = V(" m\xFAsicas")),
          (g = R()),
          (b = w("button")),
          (b.innerHTML = '<i class="fal opacity-50 fa-ellipsis-v"></i>'),
          (k = R()),
          Y(r.src, (n = t[3].image_url ?? "https://picsum.photos/200")) ||
            h(r, "src", n),
          h(r, "alt", ""),
          h(r, "class", "w-12 h-12"),
          h(l, "class", "text-base"),
          h(c, "class", "text-xs opacity-50"),
          h(s, "class", "ml-4"),
          h(b, "class", "ml-auto p-2"),
          h(e, "class", "flex items-center");
      },
      m(S, v) {
        M(S, e, v),
          f(e, r),
          f(e, i),
          f(e, s),
          f(s, l),
          f(l, o),
          f(s, u),
          f(s, c),
          f(c, d),
          f(c, _),
          f(c, m),
          f(e, g),
          f(e, b),
          f(e, k),
          y ||
            ((T = [
              H(b, "click", E),
              H(e, "click", function () {
                Se(Ge.bind(null, "#/playlists/" + t[3]._id)) &&
                  Ge.bind(null, "#/playlists/" + t[3]._id).apply(this, arguments);
              }),
            ]),
            (y = !0));
      },
      p(S, v) {
        (t = S),
          v & 4 &&
            !Y(r.src, (n = t[3].image_url ?? "https://picsum.photos/200")) &&
            h(r, "src", n),
          v & 4 && a !== (a = t[3].name + "") && te(o, a),
          v & 4 && p !== (p = t[3].songs.length + "") && te(_, p);
      },
      d(S) {
        S && j(e), (y = !1), re(T);
      },
    };
  }
  function Sl(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a,
      o,
      u,
      c,
      d,
      p,
      _,
      m,
      g,
      b,
      k,
      y = t[1].length + "",
      T,
      E,
      S,
      v,
      $,
      x;
    const D = [El, xl],
      I = [];
    function O(C, L) {
      return C[3] ? 0 : C[0] ? 1 : -1;
    }
    ~(e = O(t)) && (r = I[e] = D[e](t)), (d = new Et({}));
    let P = t[2],
      z = [];
    for (let C = 0; C < P.length; C += 1) z[C] = Lr($r(t, P, C));
    return {
      c() {
        r && r.c(),
          (n = R()),
          (i = w("div")),
          (s = w("h1")),
          (s.textContent = "Sua biblioteca"),
          (l = R()),
          (a = w("button")),
          (a.innerHTML = '<i class="far fa-plus"></i>'),
          (o = R()),
          (u = w("ul")),
          (c = w("li")),
          oe(d.$$.fragment),
          (p = R()),
          (_ = w("div")),
          (m = w("h1")),
          (m.textContent = "M\xFAsicas Curtidas"),
          (g = R()),
          (b = w("p")),
          (k = V("Playlist \u2022 ")),
          (T = V(y)),
          (E = V(" m\xFAsicas")),
          (S = R());
        for (let C = 0; C < z.length; C += 1) z[C].c();
        h(i, "class", "flex items-center justify-between text-2xl p-5 pt-12"),
          h(m, "class", "text-base"),
          h(b, "class", "text-xs opacity-50"),
          h(c, "class", "flex items-center space-x-4"),
          h(
            u,
            "class",
            "p-5 pt-0 pb-24 h-full overflow-y-auto space-y-2 rounded-3xl"
          );
      },
      m(C, L) {
        ~e && I[e].m(C, L),
          M(C, n, L),
          M(C, i, L),
          f(i, s),
          f(i, l),
          f(i, a),
          M(C, o, L),
          M(C, u, L),
          f(u, c),
          se(d, c, null),
          f(c, p),
          f(c, _),
          f(_, m),
          f(_, g),
          f(_, b),
          f(b, k),
          f(b, T),
          f(b, E),
          f(u, S);
        for (let B = 0; B < z.length; B += 1) z[B].m(u, null);
        (v = !0),
          $ ||
            ((x = [
              H(a, "click", t[10]),
              H(c, "click", Ge.bind(null, "#/playlists/liked")),
            ]),
            ($ = !0));
      },
      p(C, [L]) {
        let B = e;
        if (
          ((e = O(C)),
          e === B
            ? ~e && I[e].p(C, L)
            : (r &&
                (G(),
                U(I[B], 1, 1, () => {
                  I[B] = null;
                }),
                Q()),
              ~e
                ? ((r = I[e]),
                  r ? r.p(C, L) : ((r = I[e] = D[e](C)), r.c()),
                  N(r, 1),
                  r.m(n.parentNode, n))
                : (r = null)),
          (!v || L & 2) && y !== (y = C[1].length + "") && te(T, y),
          L & 5)
        ) {
          P = C[2];
          let A;
          for (A = 0; A < P.length; A += 1) {
            const K = $r(C, P, A);
            z[A] ? z[A].p(K, L) : ((z[A] = Lr(K)), z[A].c(), z[A].m(u, null));
          }
          for (; A < z.length; A += 1) z[A].d(1);
          z.length = P.length;
        }
      },
      i(C) {
        v || (N(r), N(d.$$.fragment, C), (v = !0));
      },
      o(C) {
        U(r), U(d.$$.fragment, C), (v = !1);
      },
      d(C) {
        ~e && I[e].d(C),
          C && j(n),
          C && j(i),
          C && j(o),
          C && j(u),
          le(d),
          gt(z, C),
          ($ = !1),
          re(x);
      },
    };
  }
  function Cl(t, e, r) {
    let n, i;
    q(t, me, (g) => r(1, (n = g))), q(t, we, (g) => r(2, (i = g)));
    let s, l;
    async function a() {
      const g = await Bs({
        name: s.name,
        image_url: `https://picsum.photos/seed/${Date.now()}/300`,
      });
      we.update((b) => b.concat(g.data)), r(3, (s = null));
    }
    async function o() {
      await kt("PLAYLIST", l._id), await rt(l.songs.slice()), r(0, (l = null));
    }
    async function u() {
      we.update((g) => g.filter((b) => b._id != l?._id)),
        await Us(l._id),
        Fs("PLAYLIST", l?._id),
        r(0, (l = null));
    }
    function c() {
      (s.name = this.value), r(3, s);
    }
    return [
      l,
      n,
      i,
      s,
      a,
      o,
      u,
      c,
      () => r(3, (s = null)),
      () => r(0, (l = null)),
      () => r(3, (s = {})),
      (g, b) => {
        b.stopPropagation(), r(0, (l = g));
      },
    ];
  }
  class Ol extends de {
    constructor(e) {
      super(), fe(this, e, Cl, Sl, ne, {});
    }
  }
  function Nr(t, e, r) {
    const n = t.slice();
    return (n[21] = e[r]), n;
  }
  function jr(t) {
    let e, r, n, i, s, l, a, o, u, c, d, p, _, m, g, b, k, y, T, E, S;
    return {
      c() {
        (e = w("div")),
          (r = w("h1")),
          (r.textContent = "Editar playlist"),
          (n = R()),
          (i = w("img")),
          (l = R()),
          (a = w("form")),
          (o = w("input")),
          (c = R()),
          (d = w("input")),
          (_ = R()),
          (m = w("div")),
          (g = w("button")),
          (g.textContent = "CANCELAR"),
          (b = R()),
          (k = w("button")),
          (k.textContent = "SALVAR"),
          h(r, "class", "font-bold"),
          h(i, "class", "w-32 h-32 mt-4 rounded"),
          Y(i.src, (s = t[1].image_url)) || h(i, "src", s),
          h(i, "alt", ""),
          h(o, "name", "image_url"),
          (o.value = u = t[1].image_url),
          h(o, "placeholder", "URL da Imagem"),
          h(
            o,
            "class",
            "border-b-[0.5px] border-black placeholder:text-white/20 w-full py-1 text-2xl bg-transparent text-center"
          ),
          h(d, "name", "name"),
          (d.value = p = t[1].name),
          h(
            d,
            "class",
            "border-b-[0.5px] mt-4 border-black w-full py-1 underline text-2xl bg-transparent text-center"
          ),
          h(g, "class", "text-neutral-400"),
          h(k, "class", "text-spotify"),
          h(m, "class", "flex justify-around w-48 text-xs mt-8"),
          h(a, "class", "w-64 mt-4 flex flex-col items-center"),
          h(
            e,
            "class",
            "absolute inset-0 bg-gradient-to-b from-neutral-500 to-black z-10 pt-32 flex flex-col items-center"
          );
      },
      m(v, $) {
        M(v, e, $),
          f(e, r),
          f(e, n),
          f(e, i),
          f(e, l),
          f(e, a),
          f(a, o),
          f(a, c),
          f(a, d),
          f(a, _),
          f(a, m),
          f(m, g),
          f(m, b),
          f(m, k),
          (T = !0),
          E || ((S = [H(g, "click", t[12]), H(a, "submit", t[8])]), (E = !0));
      },
      p(v, $) {
        (!T || ($ & 2 && !Y(i.src, (s = v[1].image_url)))) && h(i, "src", s),
          (!T || ($ & 2 && u !== (u = v[1].image_url) && o.value !== u)) &&
            (o.value = u),
          (!T || ($ & 2 && p !== (p = v[1].name) && d.value !== p)) &&
            (d.value = p);
      },
      i(v) {
        T ||
          (ae(() => {
            y || (y = ee(e, ge, { x: 300, duration: 500 }, !0)), y.run(1);
          }),
          (T = !0));
      },
      o(v) {
        y || (y = ee(e, ge, { x: 300, duration: 500 }, !1)), y.run(0), (T = !1);
      },
      d(v) {
        v && j(e), v && y && y.end(), (E = !1), re(S);
      },
    };
  }
  function Rl(t) {
    let e, r, n, i;
    return {
      c() {
        (e = w("img")),
          Y(e.src, (r = t[1].image_url)) || h(e, "src", r),
          h(e, "class", "w-32 h-32 mx-auto mb-5"),
          h(e, "alt", "");
      },
      m(s, l) {
        M(s, e, l), n || ((i = H(e, "click", t[13])), (n = !0));
      },
      p(s, l) {
        l & 2 && !Y(e.src, (r = s[1].image_url)) && h(e, "src", r);
      },
      i: F,
      o: F,
      d(s) {
        s && j(e), (n = !1), i();
      },
    };
  }
  function Al(t) {
    let e, r;
    return (
      (e = new Et({ props: { class: "h-32 w-32 text-5xl mx-auto mb-5" } })),
      {
        c() {
          oe(e.$$.fragment);
        },
        m(n, i) {
          se(e, n, i), (r = !0);
        },
        p: F,
        i(n) {
          r || (N(e.$$.fragment, n), (r = !0));
        },
        o(n) {
          U(e.$$.fragment, n), (r = !1);
        },
        d(n) {
          le(e, n);
        },
      }
    );
  }
  function Pl(t) {
    let e;
    return {
      c() {
        (e = w("div")),
          (e.innerHTML = `<h1 class="opacity-50 mb-4">Voc\xEA n\xE3o curtiu nenhuma m\xFAsica ainda</h1> 
  
        <a href="#/search" class="bg-black/50 rounded-full p-2 px-4">Buscar m\xFAsicas</a>`),
          h(e, "class", "mt-8 text-center");
      },
      m(r, n) {
        M(r, e, n);
      },
      p: F,
      d(r) {
        r && j(e);
      },
    };
  }
  function Tl(t) {
    let e;
    return {
      c() {
        (e = w("div")),
          (e.innerHTML = `<h1 class="opacity-50 mb-4">Voc\xEA n\xE3o adicionou nenhuma m\xFAsica ainda</h1> 
  
        <a href="#/search" class="bg-black/50 rounded-full p-2 px-4">Adicionar m\xFAsicas</a>`),
          h(e, "class", "mt-8 text-center");
      },
      m(r, n) {
        M(r, e, n);
      },
      p: F,
      d(r) {
        r && j(e);
      },
    };
  }
  function $l(t) {
    let e, r, n, i, s, l, a, o, u, c, d, p;
    return {
      c() {
        (e = w("div")),
          (r = w("button")),
          (n = w("i")),
          (s = R()),
          (l = w("button")),
          (a = w("i")),
          (u = R()),
          (c = w("button")),
          (c.innerHTML = '<i class="fas fa-play"></i>'),
          h(
            n,
            "class",
            (i =
              "fal " +
              (t[3] ? "text-spotify animate-[like_500ms]" : "opacity-50") +
              " text-2xl fa-repeat-alt")
          ),
          h(
            a,
            "class",
            (o =
              "fal " +
              (t[2] ? "text-spotify animate-[like_500ms]" : "opacity-50") +
              " text-2xl fa-shuffle")
          ),
          h(c, "class", "bg-spotify-dark w-10 h-10 rounded-full"),
          h(e, "class", "my-5 flex justify-end space-x-5");
      },
      m(_, m) {
        M(_, e, m),
          f(e, r),
          f(r, n),
          f(e, s),
          f(e, l),
          f(l, a),
          f(e, u),
          f(e, c),
          d ||
            ((p = [
              H(r, "click", t[14]),
              H(l, "click", t[15]),
              H(c, "click", t[7]),
            ]),
            (d = !0));
      },
      p(_, m) {
        m & 8 &&
          i !==
            (i =
              "fal " +
              (_[3] ? "text-spotify animate-[like_500ms]" : "opacity-50") +
              " text-2xl fa-repeat-alt") &&
          h(n, "class", i),
          m & 4 &&
            o !==
              (o =
                "fal " +
                (_[2] ? "text-spotify animate-[like_500ms]" : "opacity-50") +
                " text-2xl fa-shuffle") &&
            h(a, "class", o);
      },
      d(_) {
        _ && j(e), (d = !1), re(p);
      },
    };
  }
  function Mr(t, e) {
    let r, n, i;
    return (
      (n = new Hn({ props: { song: e[21] } })),
      n.$on("click", function () {
        Se(e[6].bind(e[21]._id, e[1].songs)) &&
          e[6].bind(e[21]._id, e[1].songs).apply(this, arguments);
      }),
      {
        key: t,
        first: null,
        c() {
          (r = _e()), oe(n.$$.fragment), (this.first = r);
        },
        m(s, l) {
          M(s, r, l), se(n, s, l), (i = !0);
        },
        p(s, l) {
          e = s;
          const a = {};
          l & 1 && (a.song = e[21]), n.$set(a);
        },
        i(s) {
          i || (N(n.$$.fragment, s), (i = !0));
        },
        o(s) {
          U(n.$$.fragment, s), (i = !1);
        },
        d(s) {
          s && j(r), le(n, s);
        },
      }
    );
  }
  function Ll(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a = t[1].name + "",
      o,
      u,
      c,
      d,
      p = [],
      _ = new Map(),
      m,
      g,
      b,
      k,
      y = t[4] && jr(t);
    const T = [Al, Rl],
      E = [];
    function S(O, P) {
      return O[1].type === "LIKES" ? 0 : 1;
    }
    (n = S(t)), (i = E[n] = T[n](t));
    function v(O, P) {
      return O[1].songs.length > 0 ? $l : O[1].type !== "LIKES" ? Tl : Pl;
    }
    let $ = v(t),
      x = $(t),
      D = t[0];
    const I = (O) => O[21]._id;
    for (let O = 0; O < D.length; O += 1) {
      let P = Nr(t, D, O),
        z = I(P);
      _.set(z, (p[O] = Mr(z, P)));
    }
    return {
      c() {
        y && y.c(),
          (e = R()),
          (r = w("div")),
          i.c(),
          (s = R()),
          (l = w("h1")),
          (o = V(a)),
          (u = R()),
          x.c(),
          (c = R()),
          (d = w("ul"));
        for (let O = 0; O < p.length; O += 1) p[O].c();
        h(l, "class", "font-bold text-center text-xl"),
          h(
            d,
            "class",
            (m =
              "space-y-2 overflow-y-auto h-96 " +
              (t[5] ? "pb-36" : "pb-16") +
              " rounded")
          ),
          h(r, "class", "p-5 pt-12");
      },
      m(O, P) {
        y && y.m(O, P),
          M(O, e, P),
          M(O, r, P),
          E[n].m(r, null),
          f(r, s),
          f(r, l),
          f(l, o),
          f(r, u),
          x.m(r, null),
          f(r, c),
          f(r, d);
        for (let z = 0; z < p.length; z += 1) p[z].m(d, null);
        (g = !0), b || ((k = H(d, "scroll", t[9])), (b = !0));
      },
      p(O, [P]) {
        O[4]
          ? y
            ? (y.p(O, P), P & 16 && N(y, 1))
            : ((y = jr(O)), y.c(), N(y, 1), y.m(e.parentNode, e))
          : y &&
            (G(),
            U(y, 1, 1, () => {
              y = null;
            }),
            Q());
        let z = n;
        (n = S(O)),
          n === z
            ? E[n].p(O, P)
            : (G(),
              U(E[z], 1, 1, () => {
                E[z] = null;
              }),
              Q(),
              (i = E[n]),
              i ? i.p(O, P) : ((i = E[n] = T[n](O)), i.c()),
              N(i, 1),
              i.m(r, s)),
          (!g || P & 2) && a !== (a = O[1].name + "") && te(o, a),
          $ === ($ = v(O)) && x
            ? x.p(O, P)
            : (x.d(1), (x = $(O)), x && (x.c(), x.m(r, c))),
          P & 67 &&
            ((D = O[0]),
            G(),
            (p = dn(p, P, I, 1, O, D, _, d, fn, Mr, null, Nr)),
            Q()),
          (!g ||
            (P & 32 &&
              m !==
                (m =
                  "space-y-2 overflow-y-auto h-96 " +
                  (O[5] ? "pb-36" : "pb-16") +
                  " rounded"))) &&
            h(d, "class", m);
      },
      i(O) {
        if (!g) {
          N(y), N(i);
          for (let P = 0; P < D.length; P += 1) N(p[P]);
          g = !0;
        }
      },
      o(O) {
        U(y), U(i);
        for (let P = 0; P < p.length; P += 1) U(p[P]);
        g = !1;
      },
      d(O) {
        y && y.d(O), O && j(e), O && j(r), E[n].d(), x.d();
        for (let P = 0; P < p.length; P += 1) p[P].d();
        (b = !1), k();
      },
    };
  }
  function Nl(t, e, r) {
    let n, i, s, l, a;
    q(t, Re, (x) => r(11, (n = x))),
      q(t, we, (x) => r(16, (i = x))),
      q(t, me, (x) => r(17, (s = x))),
      q(t, pi, (x) => r(18, (l = x))),
      q(t, W, (x) => r(5, (a = x)));
    let { params: o } = e;
    const u = new URLSearchParams(l);
    function c(x) {
      return x === "liked"
        ? { _id: "liked", name: "M\xFAsicas Curtidas", type: "LIKES", songs: s }
        : i.find((D) => D._id === x);
    }
    const d = c(o.playlist);
    Re.set(d);
    let p = [],
      _ = !1,
      m = !1,
      g = u.get("action") === "edit";
    sn(() => {
      je(
        kr(n).then((x) => {
          r(0, (p = x.data));
        })
      );
    }),
      Vt(() => Re.set());
    function b([...x]) {
      !x.length ||
        !x.includes(this) ||
        je(async () => {
          const D = [this];
          for (;;) {
            const I = x.shift();
            if (I === this) break;
            (m || _) && x.push(I);
          }
          _ && Ms(x), D.push(...x), await kt("PLAYLIST", d._id), await rt(D, m);
        });
    }
    function k() {
      const x = n.songs;
      if (_) {
        const D = x[Math.floor(Math.random() * x.length)];
        b.call(D, x);
      } else b.call(x[0], x);
    }
    async function y(x) {
      x.preventDefault();
      const D = new FormData(this),
        I = D.get("image_url").trim(),
        O = D.get("name").trim();
      if (I) {
        const P = await fetch(I);
        if (P.status < 200 || P.status >= 300) return;
        if (!P.headers.get("content-type").includes("image/")) return;
        r(1, (d.image_url = I), d);
      }
      O && r(1, (d.name = O), d),
        await he(() => X.put("playlists/" + d._id, { name: O, image_url: I })),
        r(4, (g = !1));
    }
    function T() {
      this.scrollTop >= this.scrollHeight - this.clientHeight &&
        je(
          kr(n, p.length).then((x) => {
            r(0, (p = p.concat(x.data)));
          })
        );
    }
    const E = () => r(4, (g = null)),
      S = () => r(4, (g = !0)),
      v = () => r(3, (m = !m)),
      $ = () => r(2, (_ = !_));
    return (
      (t.$$set = (x) => {
        "params" in x && r(10, (o = x.params));
      }),
      (t.$$.update = () => {
        if (t.$$.dirty & 2049) {
          const x = n.songs;
          r(0, (p = p.filter((D) => x.includes(D._id))));
        }
      }),
      [p, d, _, m, g, a, b, k, y, T, o, n, E, S, v, $]
    );
  }
  class jl extends de {
    constructor(e) {
      super(), fe(this, e, Nl, Ll, ne, { params: 10 });
    }
  }
  function Dr(t, e, r) {
    const n = t.slice();
    return (n[12] = e[r]), n;
  }
  function zr(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a = t[0].name + "",
      o,
      u,
      c,
      d = t[0].author + "",
      p,
      _,
      m,
      g,
      b,
      k,
      y = t[2],
      T,
      E = t[2] ? "Curtida" : "Curtir",
      S,
      v,
      $,
      x,
      D = t[3] && t[3].songs.includes(t[0]._id),
      I,
      O,
      P,
      z,
      C = t[1] && Br(t),
      L = Ir(t),
      B = D && Fr(t);
    return {
      c() {
        C && C.c(),
          (e = R()),
          (r = w("div")),
          (n = w("img")),
          (s = R()),
          (l = w("h1")),
          (o = V(a)),
          (u = R()),
          (c = w("h3")),
          (p = V(d)),
          (_ = R()),
          (m = w("button")),
          (m.innerHTML = '<i class="fas fa-times"></i>'),
          (g = R()),
          (b = w("ul")),
          (k = w("li")),
          L.c(),
          (T = R()),
          (S = V(E)),
          (v = R()),
          ($ = w("li")),
          ($.innerHTML = `<i class="far fa-music mr-4 opacity-50"></i>
          Adicionar \xE0 Playlist`),
          (x = R()),
          B && B.c(),
          h(n, "class", "w-24 h-24 mb-2"),
          Y(n.src, (i = t[0].image_url)) || h(n, "src", i),
          h(n, "alt", ""),
          h(l, "class", "text-xl text-center font-medium"),
          h(c, "class", "text-xs opacity-50"),
          h(m, "class", "absolute top-5 right-5 opacity-50"),
          h(b, "class", "flex flex-col w-full space-y-3 mt-5 px-10"),
          h(
            r,
            "class",
            "absolute inset-0 bg-black z-10 pt-32 flex flex-col items-center"
          );
      },
      m(A, K) {
        C && C.m(A, K),
          M(A, e, K),
          M(A, r, K),
          f(r, n),
          f(r, s),
          f(r, l),
          f(l, o),
          f(r, u),
          f(r, c),
          f(c, p),
          f(r, _),
          f(r, m),
          f(r, g),
          f(r, b),
          f(b, k),
          L.m(k, null),
          f(k, T),
          f(k, S),
          f(b, v),
          f(b, $),
          f(b, x),
          B && B.m(b, null),
          (O = !0),
          P ||
            ((z = [
              H(m, "click", t[9]),
              H(k, "click", t[10]),
              H($, "click", t[11]),
            ]),
            (P = !0));
      },
      p(A, K) {
        A[1]
          ? C
            ? (C.p(A, K), K & 2 && N(C, 1))
            : ((C = Br(A)), C.c(), N(C, 1), C.m(e.parentNode, e))
          : C &&
            (G(),
            U(C, 1, 1, () => {
              C = null;
            }),
            Q()),
          (!O || (K & 1 && !Y(n.src, (i = A[0].image_url)))) && h(n, "src", i),
          (!O || K & 1) && a !== (a = A[0].name + "") && te(o, a),
          (!O || K & 1) && d !== (d = A[0].author + "") && te(p, d),
          K & 4 && ne(y, (y = A[2]))
            ? (L.d(1), (L = Ir(A)), L.c(), L.m(k, T))
            : L.p(A, K),
          (!O || K & 4) && E !== (E = A[2] ? "Curtida" : "Curtir") && te(S, E),
          K & 9 && (D = A[3] && A[3].songs.includes(A[0]._id)),
          D
            ? B
              ? B.p(A, K)
              : ((B = Fr(A)), B.c(), B.m(b, null))
            : B && (B.d(1), (B = null));
      },
      i(A) {
        O ||
          (N(C),
          ae(() => {
            I || (I = ee(r, ge, { y: 300, duration: 500 }, !0)), I.run(1);
          }),
          (O = !0));
      },
      o(A) {
        U(C),
          I || (I = ee(r, ge, { y: 300, duration: 500 }, !1)),
          I.run(0),
          (O = !1);
      },
      d(A) {
        C && C.d(A),
          A && j(e),
          A && j(r),
          L.d(A),
          B && B.d(),
          A && I && I.end(),
          (P = !1),
          re(z);
      },
    };
  }
  function Br(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a,
      o,
      u,
      c,
      d,
      p = t[4],
      _ = [];
    for (let m = 0; m < p.length; m += 1) _[m] = Ur(Dr(t, p, m));
    return {
      c() {
        (e = w("div")),
          (r = w("div")),
          (n = w("button")),
          (n.innerHTML = '<i class="fas fa-arrow-left"></i>'),
          (i = R()),
          (s = w("h1")),
          (s.textContent = "Adicionar \xE0 Playlist"),
          (l = R()),
          (a = w("ul"));
        for (let m = 0; m < _.length; m += 1) _[m].c();
        h(n, "class", "opacity-50"),
          h(s, "class", "absolute inset-x-20 font-bold text-center"),
          h(r, "class", "absolute top-5 inset-x-5 flex"),
          h(
            a,
            "class",
            "flex flex-col w-full space-y-3 mt-5 px-10 overflow-y-auto"
          ),
          h(
            e,
            "class",
            "absolute inset-0 bg-black z-20 pt-12 flex flex-col items-center"
          );
      },
      m(m, g) {
        M(m, e, g), f(e, r), f(r, n), f(r, i), f(r, s), f(e, l), f(e, a);
        for (let b = 0; b < _.length; b += 1) _[b].m(a, null);
        (u = !0), c || ((d = H(n, "click", t[8])), (c = !0));
      },
      p(m, g) {
        if (g & 48) {
          p = m[4];
          let b;
          for (b = 0; b < p.length; b += 1) {
            const k = Dr(m, p, b);
            _[b] ? _[b].p(k, g) : ((_[b] = Ur(k)), _[b].c(), _[b].m(a, null));
          }
          for (; b < _.length; b += 1) _[b].d(1);
          _.length = p.length;
        }
      },
      i(m) {
        u ||
          (ae(() => {
            o || (o = ee(e, ge, { y: 300, duration: 500 }, !0)), o.run(1);
          }),
          (u = !0));
      },
      o(m) {
        o || (o = ee(e, ge, { y: 300, duration: 500 }, !1)), o.run(0), (u = !1);
      },
      d(m) {
        m && j(e), gt(_, m), m && o && o.end(), (c = !1), d();
      },
    };
  }
  function Ur(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a = t[12].name + "",
      o,
      u,
      c,
      d,
      p = t[12].songs.length + "",
      _,
      m,
      g,
      b,
      k;
    return {
      c() {
        (e = w("li")),
          (r = w("img")),
          (i = R()),
          (s = w("div")),
          (l = w("h1")),
          (o = V(a)),
          (u = R()),
          (c = w("h3")),
          (d = V("Playlist \u2022 ")),
          (_ = V(p)),
          (m = V(" m\xFAsicas")),
          (g = R()),
          h(r, "class", "w-12"),
          Y(r.src, (n = t[12].image_url ?? "https://picsum.photos/200")) ||
            h(r, "src", n),
          h(r, "alt", ""),
          h(c, "class", "opacity-50 text-xs"),
          h(e, "class", "flex items-center space-x-3");
      },
      m(y, T) {
        M(y, e, T),
          f(e, r),
          f(e, i),
          f(e, s),
          f(s, l),
          f(l, o),
          f(s, u),
          f(s, c),
          f(c, d),
          f(c, _),
          f(c, m),
          f(e, g),
          b ||
            ((k = H(e, "click", function () {
              Se(t[5].bind(t[12])) && t[5].bind(t[12]).apply(this, arguments);
            })),
            (b = !0));
      },
      p(y, T) {
        (t = y),
          T & 16 &&
            !Y(r.src, (n = t[12].image_url ?? "https://picsum.photos/200")) &&
            h(r, "src", n),
          T & 16 && a !== (a = t[12].name + "") && te(o, a),
          T & 16 && p !== (p = t[12].songs.length + "") && te(_, p);
      },
      d(y) {
        y && j(e), (b = !1), k();
      },
    };
  }
  function Ir(t) {
    let e, r;
    return {
      c() {
        (e = w("i")),
          h(
            e,
            "class",
            (r =
              (t[2] ? "fas text-spotify" : "far opacity-50") +
              " fa-heart animate-[like_500ms] mr-4")
          );
      },
      m(n, i) {
        M(n, e, i);
      },
      p(n, i) {
        i & 4 &&
          r !==
            (r =
              (n[2] ? "fas text-spotify" : "far opacity-50") +
              " fa-heart animate-[like_500ms] mr-4") &&
          h(e, "class", r);
      },
      d(n) {
        n && j(e);
      },
    };
  }
  function Fr(t) {
    let e, r, n;
    return {
      c() {
        (e = w("li")),
          (e.innerHTML = `<i class="far fa-minus-circle mr-4 opacity-50"></i>
            Remover desta Playlist`);
      },
      m(i, s) {
        M(i, e, s), r || ((n = H(e, "click", t[6])), (r = !0));
      },
      p: F,
      d(i) {
        i && j(e), (r = !1), n();
      },
    };
  }
  function Ml(t) {
    let e,
      r,
      n = t[0] && zr(t);
    return {
      c() {
        n && n.c(), (e = _e());
      },
      m(i, s) {
        n && n.m(i, s), M(i, e, s), (r = !0);
      },
      p(i, [s]) {
        i[0]
          ? n
            ? (n.p(i, s), s & 1 && N(n, 1))
            : ((n = zr(i)), n.c(), N(n, 1), n.m(e.parentNode, e))
          : n &&
            (G(),
            U(n, 1, 1, () => {
              n = null;
            }),
            Q());
      },
      i(i) {
        r || (N(n), (r = !0));
      },
      o(i) {
        U(n), (r = !1);
      },
      d(i) {
        n && n.d(i), i && j(e);
      },
    };
  }
  function Dl(t, e, r) {
    let n, i, s, l, a;
    q(t, We, (g) => r(0, (i = g))),
      q(t, Re, (g) => r(3, (s = g))),
      q(t, me, (g) => r(7, (l = g))),
      q(t, we, (g) => r(4, (a = g)));
    async function o() {
      this.songs.includes(i._id) ||
        (await he(() => X.post(`playlists/${this._id}/${i._id}`)),
        this.songs.push(i._id),
        We.set());
    }
    async function u() {
      s.type === "LIKES" && rr(i._id, !1),
        await he(() => X.delete(`playlists/${s._id}/${i._id}`)),
        Le(Re, (s.songs = s.songs.filter((g) => g != i._id)), s),
        We.set();
    }
    let c = !1;
    const d = () => r(1, (c = !1)),
      p = () => We.set(),
      _ = () => Mn(i._id),
      m = () => r(1, (c = !0));
    return (
      (t.$$.update = () => {
        t.$$.dirty & 129 && r(2, (n = l.includes(i?._id)));
      }),
      [i, c, n, s, a, o, u, l, d, p, _, m]
    );
  }
  class zl extends de {
    constructor(e) {
      super(), fe(this, e, Dl, Ml, ne, {});
    }
  }
  function Hr(t) {
    let e,
      r,
      n,
      i,
      s,
      l,
      a,
      o = t[1].name + "",
      u,
      c,
      d,
      p = t[1].author + "",
      _,
      m,
      g,
      b,
      k,
      y,
      T,
      E,
      S = t[2],
      v,
      $,
      x,
      D,
      I,
      O,
      P,
      z,
      C,
      L = qr(t);
    return {
      c() {
        (e = w("div")),
          (r = w("div")),
          (n = w("img")),
          (s = R()),
          (l = w("div")),
          (a = w("h1")),
          (u = V(o)),
          (c = R()),
          (d = w("h1")),
          (_ = V(p)),
          (m = R()),
          (g = w("div")),
          (b = w("button")),
          (k = w("i")),
          (T = R()),
          (E = w("button")),
          L.c(),
          (v = R()),
          ($ = w("button")),
          (x = w("i")),
          (I = R()),
          (O = w("div")),
          (P = w("input")),
          h(n, "class", "h-12 rounded-lg"),
          Y(n.src, (i = t[1].image_url)) || h(n, "src", i),
          h(n, "alt", ""),
          h(a, "class", "whitespace-nowrap text-base song-name"),
          h(d, "class", "opacity-50"),
          h(l, "class", "flex flex-col flex-1 overflow-hidden text-xs"),
          h(
            k,
            "class",
            (y =
              "far " +
              (t[1].mode === "bluetooth" && "text-spotify") +
              " fa-bluetooth")
          ),
          h(b, "class", "w-8"),
          h(E, "class", "w-8"),
          h(x, "class", (D = "fas " + (t[1].paused_at ? "fa-play" : "fa-pause"))),
          h($, "class", "w-8"),
          h(g, "class", "ml-4 mr-2 mt-2 flex text-xl"),
          h(r, "class", "w-full flex items-start space-x-4"),
          h(P, "min", "1"),
          h(P, "max", "100"),
          h(P, "class", "w-full h-1 mt-4"),
          h(P, "type", "range"),
          h(
            e,
            "class",
            "bg-neutral-700 rounded-xl h-16 hover:h-24 overflow-hidden transition-[height] p-2 absolute inset-x-4 bottom-20"
          );
      },
      m(B, A) {
        M(B, e, A),
          f(e, r),
          f(r, n),
          f(r, s),
          f(r, l),
          f(l, a),
          f(a, u),
          f(l, c),
          f(l, d),
          f(d, _),
          f(r, m),
          f(r, g),
          f(g, b),
          f(b, k),
          f(g, T),
          f(g, E),
          L.m(E, null),
          f(g, v),
          f(g, $),
          f($, x),
          f(e, I),
          f(e, O),
          f(O, P),
          t[9](P),
          Me(P, t[3]),
          z ||
            ((C = [
              H(b, "click", t[5]),
              H(E, "click", t[8]),
              H($, "click", t[4]),
              H(P, "input", t[6]),
              H(P, "change", t[10]),
              H(P, "input", t[10]),
            ]),
            (z = !0));
      },
      p(B, A) {
        A & 2 && !Y(n.src, (i = B[1].image_url)) && h(n, "src", i),
          A & 2 && o !== (o = B[1].name + "") && te(u, o),
          A & 2 && p !== (p = B[1].author + "") && te(_, p),
          A & 2 &&
            y !==
              (y =
                "far " +
                (B[1].mode === "bluetooth" && "text-spotify") +
                " fa-bluetooth") &&
            h(k, "class", y),
          A & 4 && ne(S, (S = B[2]))
            ? (L.d(1), (L = qr(B)), L.c(), L.m(E, null))
            : L.p(B, A),
          A & 2 &&
            D !== (D = "fas " + (B[1].paused_at ? "fa-play" : "fa-pause")) &&
            h(x, "class", D),
          A & 8 && Me(P, B[3]);
      },
      d(B) {
        B && j(e), L.d(B), t[9](null), (z = !1), re(C);
      },
    };
  }
  function qr(t) {
    let e, r;
    return {
      c() {
        (e = w("i")),
          h(
            e,
            "class",
            (r =
              (t[2] ? "fas text-spotify" : "far") +
              " fa-heart animate-[like_500ms]")
          );
      },
      m(n, i) {
        M(n, e, i);
      },
      p(n, i) {
        i & 4 &&
          r !==
            (r =
              (n[2] ? "fas text-spotify" : "far") +
              " fa-heart animate-[like_500ms]") &&
          h(e, "class", r);
      },
      d(n) {
        n && j(e);
      },
    };
  }
  function Bl(t) {
    let e,
      r = t[1] && Hr(t);
    return {
      c() {
        r && r.c(), (e = _e());
      },
      m(n, i) {
        r && r.m(n, i), M(n, e, i);
      },
      p(n, [i]) {
        n[1]
          ? r
            ? r.p(n, i)
            : ((r = Hr(n)), r.c(), r.m(e.parentNode, e))
          : r && (r.d(1), (r = null));
      },
      i: F,
      o: F,
      d(n) {
        r && r.d(n), n && j(e);
      },
    };
  }
  function Ul(t, e, r) {
    let n, i, s, l;
    q(t, W, (g) => r(1, (i = g))),
      q(t, me, (g) => r(7, (s = g))),
      q(t, ht, (g) => r(3, (l = g)));
    function a() {
      return vr(async () => {
        if (i.paused_at) {
          const g = Ie() - (i.paused_at - i.played_at);
          if (
            (Le(W, (i.paused_at = void 0), i),
            Le(W, (i.played_at = g), i),
            !(await J("server", "resume")))
          ) {
            const b = await J("getVehicle"),
              k = await J("server", "play", b, i.url, l / 100, g);
            k.error ? (W.set(), Ee.set(k.error)) : Le(W, (i.mode = k.mode), i);
          }
        } else if (i.mode === "dj") await J("server", "stop"), W.set(null);
        else {
          const g = await J("isInHand");
          Le(W, (i.paused_at = Ie()), i), await J("server", g ? "stop" : "pause");
        }
      });
    }
    async function o() {
      const g = await J("getVehicle");
      return vr(() =>
        J("server", "toggleMode", g).then((b) => {
          b?.error ? Ee.set(b.error) : b && Le(W, (i.mode = b), i);
        })
      );
    }
    let u, c;
    function d() {
      const g =
        (this.valueAsNumber - parseInt(this.min)) /
        (parseInt(this.max) - parseInt(this.min));
      (this.style =
        "background-image: -webkit-gradient(linear, 0% 0%, 100% 0%, color-stop(" +
        g +
        ", #1ed760), color-stop(" +
        g +
        ", #303030));"),
        clearTimeout(c),
        (c = setTimeout(() => {
          J("server", "setVolume", this.value / 100);
        }, 200));
    }
    const p = () => Mn(i._id);
    function _(g) {
      jt[g ? "unshift" : "push"](() => {
        (u = g), r(0, u);
      });
    }
    function m() {
      (l = Yn(this.value)), ht.set(l);
    }
    return (
      (t.$$.update = () => {
        t.$$.dirty & 130 && r(2, (n = s.includes(i?._id))),
          t.$$.dirty & 1 && u != null && d.call(u);
      }),
      [u, i, n, l, a, o, d, s, p, _, m]
    );
  }
  class Il extends de {
    constructor(e) {
      super(), fe(this, e, Ul, Bl, ne, {});
    }
  }
  function Vr(t) {
    let e, r, n, i, s, l, a, o, u, c, d, p, _, m;
    return {
      c() {
        (e = w("div")),
          (r = w("div")),
          (n = w("h1")),
          (n.textContent = "Lafy"),
          (i = R()),
          (s = w("h3")),
          (l = V(t[0])),
          (a = R()),
          (o = w("div")),
          (u = w("button")),
          (u.textContent = "OK"),
          h(n, "class", "mb-2"),
          h(s, "class", "opacity-60 text-sm"),
          h(u, "class", "text-blue-600 font-bold"),
          h(o, "class", "text-center mt-2"),
          h(r, "class", "bg-neutral-800 w-3/4 rounded p-2"),
          h(e, "class", "absolute grid-center inset-0 bg-black/50 z-50");
      },
      m(g, b) {
        M(g, e, b),
          f(e, r),
          f(r, n),
          f(r, i),
          f(r, s),
          f(s, l),
          f(r, a),
          f(r, o),
          f(o, u),
          (p = !0),
          _ || ((m = H(u, "click", t[1])), (_ = !0));
      },
      p(g, b) {
        (!p || b & 1) && te(l, g[0]);
      },
      i(g) {
        p ||
          (ae(() => {
            c || (c = ee(r, cr, {}, !0)), c.run(1);
          }),
          ae(() => {
            d || (d = ee(e, Qe, {}, !0)), d.run(1);
          }),
          (p = !0));
      },
      o(g) {
        c || (c = ee(r, cr, {}, !1)),
          c.run(0),
          d || (d = ee(e, Qe, {}, !1)),
          d.run(0),
          (p = !1);
      },
      d(g) {
        g && j(e), g && c && c.end(), g && d && d.end(), (_ = !1), m();
      },
    };
  }
  function Fl(t) {
    let e,
      r,
      n = t[0] && Vr(t);
    return {
      c() {
        n && n.c(), (e = _e());
      },
      m(i, s) {
        n && n.m(i, s), M(i, e, s), (r = !0);
      },
      p(i, [s]) {
        i[0]
          ? n
            ? (n.p(i, s), s & 1 && N(n, 1))
            : ((n = Vr(i)), n.c(), N(n, 1), n.m(e.parentNode, e))
          : n &&
            (G(),
            U(n, 1, 1, () => {
              n = null;
            }),
            Q());
      },
      i(i) {
        r || (N(n), (r = !0));
      },
      o(i) {
        U(n), (r = !1);
      },
      d(i) {
        n && n.d(i), i && j(e);
      },
    };
  }
  function Hl(t, e, r) {
    let n;
    return q(t, Ee, (s) => r(0, (n = s))), [n, () => Ee.set()];
  }
  class ql extends de {
    constructor(e) {
      super(), fe(this, e, Hl, Fl, ne, {});
    }
  }
  function Jr(t) {
    let e, r, n;
    return {
      c() {
        (e = w("h1")), (r = V(t[0]));
      },
      m(i, s) {
        M(i, e, s), f(e, r);
      },
      p(i, s) {
        s & 1 && te(r, i[0]);
      },
      i(i) {
        n ||
          ae(() => {
            (n = ii(e, Qe, {})), n.start();
          });
      },
      o: F,
      d(i) {
        i && j(e);
      },
    };
  }
  function Vl(t) {
    let e,
      r,
      n = t[0],
      i,
      s,
      l = Jr(t);
    return {
      c() {
        (e = w("div")),
          (r = w("div")),
          l.c(),
          (i = R()),
          (s = w("i")),
          h(s, "class", "fal fa-spinner-third animate-spin text-5xl"),
          h(r, "class", "text-center space-y-4"),
          h(e, "class", "absolute inset-0 grid-center");
      },
      m(a, o) {
        M(a, e, o), f(e, r), l.m(r, null), f(r, i), f(r, s);
      },
      p(a, [o]) {
        o & 1 && ne(n, (n = a[0]))
          ? (G(), U(l, 1, 1, F), Q(), (l = Jr(a)), l.c(), N(l, 1), l.m(r, i))
          : l.p(a, o);
      },
      i(a) {
        N(l);
      },
      o(a) {
        U(l);
      },
      d(a) {
        a && j(e), l.d(a);
      },
    };
  }
  function Jl(t, e, r) {
    let n, i, s;
    q(t, Oe, (o) => r(1, (n = o))),
      q(t, we, (o) => r(2, (i = o))),
      q(t, me, (o) => r(3, (s = o)));
    let l = "Carregando seus dados...";
    async function a(o) {
      return (await he(() => X.get(o))).data;
    }
    return (
      sn(async () => {
        const o = {
          likes: await a("likes"),
          playlists: await a("playlists"),
          history: await a("history"),
        };
        if (o.likes.length || o.playlists.length || o.history.last_played.length)
          return (
            me.set(o.likes),
            we.set(o.playlists),
            Oe.set(o.history.last_played),
            Ge("/home")
          );
        if (
          (s !== "migrated" && s.length
            ? (r(0, (l = "Migrando suas m\xFAsicas curtidas...")),
              await he(() => X.put("likes", s)),
              me.save("migrated"))
            : me.set(o.likes),
          i !== "migrated" && i.length)
        ) {
          const u = {},
            c = Object.entries(i);
          for (const [d, p] of c) {
            r(0, (l = `Migrando suas playlists (${d + 1} / ${c.length})`));
            const { data: _ } = await he(() => X.post("playlists", p));
            u[p.id] = p._id = _._id;
          }
          n.forEach((d) => {
            d.id in u && (d.id = u[d.id]);
          }),
            i.push(...o.playlists),
            we.save("migrated");
        } else we.set(o.playlists);
        n !== "migrated" && n.length
          ? (r(0, (l = "Migrando seu hist\xF3rico...")),
            await he(() => X.put("history", { last_played: n })),
            Oe.save("migrated"),
            r(0, (l = "Finalizando migra\xE7\xE3o...")),
            await vt(1500),
            Ee.set(
              "Agora todas as suas playlists e curtidas ser\xE3o sincronizadas em todas as cidades que voc\xEA jogar."
            ))
          : Oe.set(o.history.last_played),
          Ge("/home");
      }),
      [l]
    );
  }
  class Wl extends de {
    constructor(e) {
      super(), fe(this, e, Jl, Vl, ne, {});
    }
  }
  const { window: Wr } = li;
  function Kr(t) {
    let e, r, n, i, s, l, a, o, u, c, d, p, _;
    n = new hi({
      props: {
        routes: {
          "/": Wl,
          "/home": bl,
          "/search": kl,
          "/library": Ol,
          "/playlists/:playlist": jl,
        },
      },
    });
    let m = t[2] && Yr();
    (l = new zl({})), (o = new Il({})), (c = new ql({}));
    let g = t[1] != "/" && Xr();
    return {
      c() {
        (e = w("div")),
          (r = w("div")),
          oe(n.$$.fragment),
          (i = R()),
          m && m.c(),
          (s = R()),
          oe(l.$$.fragment),
          (a = R()),
          oe(o.$$.fragment),
          (u = R()),
          oe(c.$$.fragment),
          (d = R()),
          g && g.c(),
          h(r, "class", "w-full h-full flex flex-col bg-[#0f0f0f] relative"),
          h(
            e,
            "class",
            "fixed bottom-8 right-8 w-[25rem] h-[45rem] border-4 rounded-xl overflow-hidden border-black text-white"
          );
      },
      m(b, k) {
        M(b, e, k),
          f(e, r),
          se(n, r, null),
          f(r, i),
          m && m.m(r, null),
          f(r, s),
          se(l, r, null),
          f(r, a),
          se(o, r, null),
          f(r, u),
          se(c, r, null),
          f(r, d),
          g && g.m(r, null),
          (_ = !0);
      },
      p(b, k) {
        b[2]
          ? m
            ? k & 4 && N(m, 1)
            : ((m = Yr()), m.c(), N(m, 1), m.m(r, s))
          : m &&
            (G(),
            U(m, 1, 1, () => {
              m = null;
            }),
            Q()),
          b[1] != "/"
            ? g || ((g = Xr()), g.c(), g.m(r, null))
            : g && (g.d(1), (g = null));
      },
      i(b) {
        _ ||
          (N(n.$$.fragment, b),
          N(m),
          N(l.$$.fragment, b),
          N(o.$$.fragment, b),
          N(c.$$.fragment, b),
          ae(() => {
            p || (p = ee(e, ge, { y: 400 }, !0)), p.run(1);
          }),
          (_ = !0));
      },
      o(b) {
        U(n.$$.fragment, b),
          U(m),
          U(l.$$.fragment, b),
          U(o.$$.fragment, b),
          U(c.$$.fragment, b),
          p || (p = ee(e, ge, { y: 400 }, !1)),
          p.run(0),
          (_ = !1);
      },
      d(b) {
        b && j(e),
          le(n),
          m && m.d(),
          le(l),
          le(o),
          le(c),
          g && g.d(),
          b && p && p.end();
      },
    };
  }
  function Yr(t) {
    let e, r;
    return (
      (e = new ol({})),
      {
        c() {
          oe(e.$$.fragment);
        },
        m(n, i) {
          se(e, n, i), (r = !0);
        },
        i(n) {
          r || (N(e.$$.fragment, n), (r = !0));
        },
        o(n) {
          U(e.$$.fragment, n), (r = !1);
        },
        d(n) {
          le(e, n);
        },
      }
    );
  }
  function Xr(t) {
    let e;
    return {
      c() {
        (e = w("ul")),
          (e.innerHTML = `<a href="#/home" class="flex flex-col items-center"><i class="fal fa-home text-3xl"></i>
          In\xEDcio</a> 
  
        <a href="#/search" class="flex flex-col items-center"><i class="fal fa-search text-3xl"></i>
          Buscar</a> 
  
        <a href="#/library" class="flex flex-col items-center"><i class="fal fa-rectangle-vertical-history text-3xl"></i>
          Biblioteca</a>`),
          h(
            e,
            "class",
            "absolute bottom-0 w-full grid grid-cols-3 pt-4 mt-auto bg-gradient-to-b from-transparent via-black/75 to-black text-sm h-20"
          );
      },
      m(r, n) {
        M(r, e, n);
      },
      d(r) {
        r && j(e);
      },
    };
  }
  function Kl(t) {
    let e,
      r,
      n,
      i,
      s = t[0] && Kr(t);
    return {
      c() {
        s && s.c(), (e = _e());
      },
      m(l, a) {
        s && s.m(l, a),
          M(l, e, a),
          (r = !0),
          n ||
            ((i = [H(Wr, "keydown", t[3]), H(Wr, "contextmenu", t[4])]),
            (n = !0));
      },
      p(l, [a]) {
        l[0]
          ? s
            ? (s.p(l, a), a & 1 && N(s, 1))
            : ((s = Kr(l)), s.c(), N(s, 1), s.m(e.parentNode, e))
          : s &&
            (G(),
            U(s, 1, 1, () => {
              s = null;
            }),
            Q());
      },
      i(l) {
        r || (N(s), (r = !0));
      },
      o(l) {
        U(s), (r = !1);
      },
      d(l) {
        s && s.d(l), l && j(e), (n = !1), re(i);
      },
    };
  }
  function Yl(t, e, r) {
    let n, i, s;
    q(t, di, (c) => r(1, (n = c))),
      q(t, W, (c) => r(6, (i = c))),
      q(t, ut, (c) => r(2, (s = c)));
    let l = window.invokeNative == null;
    (et.open = () => {
      J("server", "getToken")
        .then(zs)
        .finally(() => {
          r(0, (l = !0));
        });
    }),
      (et.close = () => {
        r(0, (l = !1)), It(null), J("close");
      });
    function a() {
      J("server", "isPlaying").then((c) => {
        !c && !i?.paused_at && W.set();
      });
    }
    function o(c) {
      c.code === "Escape" && n != "/" && (r(0, (l = !1)), It(null), J("close"));
    }
    function u() {
      J("toggleKeepInput");
    }
    return (
      (t.$$.update = () => {
        t.$$.dirty & 1 && a();
      }),
      [l, n, s, o, u]
    );
  }
  class Xl extends de {
    constructor(e) {
      super(), fe(this, e, Yl, Kl, ne, {});
    }
  }
  new Xl({ target: document.getElementById("app") });
  