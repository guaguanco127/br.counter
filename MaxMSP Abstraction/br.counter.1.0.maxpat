{
    "patcher": {
        "fileversion": 1,
        "appversion": {
            "major": 9,
            "minor": 0,
            "revision": 0,
            "architecture": "x64",
            "modernui": 1
        },
        "classnamespace": "box",
        "rect": [
            85.0,
            104.0,
            1260.0,
            700.0
        ],
        "bglocked": 0,
        "openinpresentation": 0,
        "default_fontsize": 12.0,
        "default_fontface": 0,
        "default_fontname": "Arial",
        "gridonopen": 1,
        "gridsize": [
            15.0,
            15.0
        ],
        "gridsnaponopen": 1,
        "objectsnaponopen": 1,
        "statusbarvisible": 2,
        "toolbarvisible": 1,
        "lefttoolbarpinned": 0,
        "toptoolbarpinned": 0,
        "righttoolbarpinned": 0,
        "bottomtoolbarpinned": 0,
        "toolbars_unpinned_last_save": 0,
        "tallnewobj": 0,
        "boxanimatetime": 200,
        "enablehscroll": 1,
        "enablevscroll": 1,
        "devicewidth": 0.0,
        "description": "br.counter.1.0 -- Created by Brian Riordan, guaguanco127@gmail.com -- https://github.com/guaguanco127/",
        "digest": "",
        "tags": "",
        "style": "",
        "subpatcher_template": "",
        "assistshowspatchername": 0,
        "boxes": [
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-signature",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        650,
                        15,
                        709.0,
                        20.0
                    ],
                    "text": "br.counter.1.0 -- Created by Brian Riordan, guaguanco127@gmail.com\nhttps://github.com/guaguanco127/",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "inlet",
                    "id": "obj-2",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        15,
                        15,
                        30.0,
                        30.0
                    ],
                    "comment": "Count (Bang/Int) bang = next count. Int = resync the hidden master to that number; mode 0 outputs it, other modes step on as if banged. Messages: reset, seed <n>, mode/max/step/permutation/fold/foldmax <n>"
                }
            },
            {
                "box": {
                    "maxclass": "inlet",
                    "id": "obj-3",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        85,
                        15,
                        30.0,
                        30.0
                    ],
                    "comment": "Mode (Int, set only) 0 sync, 1 forward, 2 backward, 3 palindrome (ends once), 4 palindrome (ends twice), 5 random, 6 urn, 7 drunk. Default 1 (or @mode)"
                }
            },
            {
                "box": {
                    "maxclass": "inlet",
                    "id": "obj-4",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        155,
                        15,
                        30.0,
                        30.0
                    ],
                    "comment": "Max (Int, set only) highest count: 7 = 0-7. Default 7 (or argument 1, or @max)"
                }
            },
            {
                "box": {
                    "maxclass": "inlet",
                    "id": "obj-5",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        225,
                        15,
                        30.0,
                        30.0
                    ],
                    "comment": "Step (Int, set only) how far each count moves, 1 or more. Drunk: the largest step. Sync ignores it. Default 1 (or @step)"
                }
            },
            {
                "box": {
                    "maxclass": "inlet",
                    "id": "obj-7",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        295,
                        15,
                        30.0,
                        30.0
                    ],
                    "comment": "Permutation (Int, set only) start offset for forward, backward and palindromes: 3 = count starts at 3. With Fold on it slides the fold window up (fold max 2, permutation 2 = counts 2-4), wrapping at Max. Default 0 (or @permutation)"
                }
            },
            {
                "box": {
                    "maxclass": "newobj",
                    "id": "obj-8",
                    "numinlets": 1,
                    "numoutlets": 2,
                    "outlettype": [
                        "",
                        ""
                    ],
                    "patching_rect": [
                        450,
                        60,
                        107.0,
                        22.0
                    ],
                    "text": "patcherargs 7",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "newobj",
                    "id": "obj-9",
                    "numinlets": 1,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        450,
                        90,
                        93.0,
                        22.0
                    ],
                    "text": "prepend max",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "outlet",
                    "id": "obj-10",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        15,
                        600,
                        30.0,
                        30.0
                    ],
                    "comment": "Count (Int)"
                }
            },
            {
                "box": {
                    "maxclass": "outlet",
                    "id": "obj-11",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        305,
                        600,
                        30.0,
                        30.0
                    ],
                    "comment": "Carry (Bang) after the last count of the cycle in the current mode (sent after the count). Not sent in random and drunk"
                }
            },
            {
                "box": {
                    "maxclass": "outlet",
                    "id": "obj-12",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        595,
                        600,
                        30.0,
                        30.0
                    ],
                    "comment": "Master (Int) the hidden counter that mode 0 reports: +1 per bang, an int sets it, wraps at Max (sent before the count)"
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-13",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        650,
                        60,
                        560,
                        80
                    ],
                    "text": "Modes: 0 sync (only the input: +1 per bang, an int jumps to that number; ignores step, permutation and fold) | 1 forward | 2 backward | 3 palindrome, ends once (0 1 2 3 2 1) | 4 palindrome, ends twice (0 1 2 3 3 2 1 0) | 5 random | 6 urn (every number once, refills itself, never repeats across a refill) | 7 drunk (moves 1..step, bounces at the edges).",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-14",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        650,
                        150,
                        560,
                        80
                    ],
                    "text": "The hidden master (+1 per bang, an int sets it, wraps at max) runs in every mode. Modes 1-7 step from the last count, so they may drift from the master; switching back to 0 snaps to it. Permutation offsets forward, backward and palindromes (with Fold on it slides the fold window: fold max 2 + permutation 2 = 2 3 4); a change shows on the next count. Changing any setting outputs nothing -- the next bang does. Max shrinking wraps the position. Carry fires on the last count before a wrap (never in random and drunk -- they have no last count).",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "comment",
                    "id": "obj-15",
                    "numinlets": 1,
                    "numoutlets": 0,
                    "outlettype": [],
                    "patching_rect": [
                        650,
                        240,
                        560,
                        110
                    ],
                    "text": "Argument: max. Attributes: @mode @max @step @permutation @fold @foldmax @seed (0 = different every time; any other number repeats the same random/urn/drunk run after reset). reset = back to the start silently (next bang outputs the start count). Fold (on while Fold Max > 0): Modulo folds the count into 0..Fold Max and restarts with the main cycle (max 7, fold max 2: 0 1 2 0 1 2 0 1 | 0); Poly runs the mode inside 0..Fold Max and loops freely (0 1 2 0 1 2 0 1 2...).",
                    "fontname": "Arial",
                    "fontsize": 12.0
                }
            },
            {
                "box": {
                    "maxclass": "v8.codebox",
                    "id": "obj-code",
                    "numinlets": 7,
                    "numoutlets": 3,
                    "outlettype": [
                        "",
                        "",
                        ""
                    ],
                    "patching_rect": [
                        15.0,
                        130.0,
                        620.0,
                        450.0
                    ],
                    "fontname": "<Monospaced>",
                    "fontsize": 12.0,
                    "filename": "none",
                    "fontface": 0,
                    "code": "// br.counter.1.0 -- multi-mode counter. Created by Brian Riordan.\n// Inlet 0: bang = step, int = step + resync the hidden master (mode 0 outputs it), plus messages\n//          reset, seed, mode, max, step, permutation, fold, foldmax (also what patcherargs sends for @attributes).\n// Inlets 1-6: mode, max, step, permutation, fold, foldmax (set only, no output).\n// Outlets: 0 count, 1 carry (bang, after the count), 2 hidden master count (sent first).\ninlets = 7;\noutlets = 3;\n\n// all counter state lives inside BRC so nothing collides with v8's own globals\nvar BRC = (function () {\n\n\t// modes: 0 sync, 1 forward, 2 backward, 3 palindrome (ends once), 4 palindrome (ends twice),\n\t//        5 random, 6 urn, 7 drunk\n\t// fold (on while foldmax > 0): 0 modulo = the count folded into 0..foldmax, restarting with the main cycle\n\t//                              1 poly   = the mode itself runs inside 0..foldmax, ignoring max\n\tvar S = { mode: 1, max: 7, step: 1, perm: 0, seed: 0, fold: 0, foldmax: 0 };\n\n\tvar cur = 0;          // last position (before folding) -- drunk walks from here\n\tvar idx = 0;          // position before the permutation offset (forward/backward/palindromes)\n\tvar dir = 1;          // last direction of travel, kept across mode changes\n\tvar ph = 0;           // palindrome phase, 0 .. period-1\n\tvar master = 0;       // hidden counter 0..max: +1 per bang, an int sets it (mode 0 reports it, outlet 2 always)\n\tvar fresh = true;     // next output is the start value\n\tvar masterFresh = true;\n\tvar lastMode = -1;\n\tvar lastTop = -1;     // range the modes ran in last time (changes with max, foldmax, fold)\n\tvar rederive = false; // range changed: palindrome phase must be rebuilt\n\tvar pool = [];        // urn: numbers not drawn yet\n\tvar lastUrn = -1;\n\tvar rng = makeRng(0);\n\n\tfunction makeRng(seed) {\n\t\tvar a = seed ? (seed >>> 0) : Math.floor(Math.random() * 4294967296) >>> 0;\n\t\treturn function () {\n\t\t\ta = (a + 0x6D2B79F5) >>> 0;\n\t\t\tvar t = a;\n\t\t\tt = Math.imul(t ^ (t >>> 15), t | 1);\n\t\t\tt ^= t + Math.imul(t ^ (t >>> 7), t | 61);\n\t\t\treturn ((t ^ (t >>> 14)) >>> 0) / 4294967296;\n\t\t};\n\t}\n\n\tfunction randInt(k) { return Math.floor(rng() * k); }\n\tfunction wrap(x, m) { return ((x % m) + m) % m; }\n\n\tfunction isPoly() { return S.fold === 1 && S.foldmax > 0; }\n\tfunction isModulo() { return S.fold === 0 && S.foldmax > 0; }\n\tfunction top() { return isPoly() ? S.foldmax : S.max; }   // highest count the modes run to\n\n\tfunction perA(E) { return E === 0 ? 1 : 2 * E; }\n\tfunction perB(E) { return 2 * (E + 1); }\n\tfunction foldA(x, E) { var p = perA(E); var t = wrap(x, p); return t <= E ? t : p - t; }\n\tfunction foldB(x, E) { var p = perB(E); var t = wrap(x, p); return t <= E ? t : p - 1 - t; }\n\n\t// --- the hidden master: +1 on every bang, an int sets it. Ignores step, permutation and fold ---\n\tfunction stepMaster(v) {\n\t\tvar L = S.max + 1;\n\t\tif (v !== undefined) master = wrap(v, L);\n\t\telse if (masterFresh) master = 0;\n\t\telse master = wrap(master + 1, L);\n\t\tmasterFresh = false;\n\t}\n\n\tfunction advance() {\n\t\tvar E = top(), R = E + 1, m = S.mode, st = S.step, entering = (m !== lastMode);\n\t\tvar u = 0, nextU = -1, carry = false;\n\n\t\tif (E !== lastTop) {\n\t\t\tcur = wrap(cur, R); idx = wrap(idx, R);\n\t\t\tpool = []; rederive = true; lastTop = E;\n\t\t}\n\n\t\tif (m === 0) {\n\t\t\t// sync is only ever the bang or the int coming in: no step, permutation or fold\n\t\t\tu = master;\n\t\t\tcarry = master + 1 > S.max;\n\t\t\tdir = 1;\n\t\t} else if (m === 1) {\n\t\t\tidx = fresh ? 0 : wrap(idx + st, R);\n\t\t\tcarry = idx + st >= R;\n\t\t\tnextU = wrap(idx + st, R);\n\t\t\tu = idx;\n\t\t\tdir = 1;\n\t\t} else if (m === 2) {\n\t\t\tidx = fresh ? E : wrap(idx - st, R);\n\t\t\tcarry = idx - st < 0;\n\t\t\tnextU = wrap(idx - st, R);\n\t\t\tu = idx;\n\t\t\tdir = -1;\n\t\t} else if (m === 3 || m === 4) {\n\t\t\tvar A = (m === 3), per = A ? perA(E) : perB(E);\n\t\t\tif (fresh) ph = 0;\n\t\t\telse {\n\t\t\t\tif (entering || rederive) {\n\t\t\t\t\t// rebuild the phase from where we are, keeping the direction of travel\n\t\t\t\t\tph = dir > 0 ? idx : (A ? wrap(per - idx, per) : per - 1 - idx);\n\t\t\t\t}\n\t\t\t\tph = wrap(ph + st, per);\n\t\t\t}\n\t\t\trederive = false;\n\t\t\tcarry = ph + st >= per;\n\t\t\tidx = A ? foldA(ph, E) : foldB(ph, E);\n\t\t\tnextU = A ? foldA(ph + st, E) : foldB(ph + st, E);\n\t\t\tvar t = wrap(ph, per);\n\t\t\tdir = (E === 0) ? 1 : (A ? (t < E ? 1 : -1) : (t <= E ? 1 : -1));\n\t\t\tu = idx;\n\t\t} else if (m === 5) {\n\t\t\tu = randInt(R);   // no carry: random has no last count\n\t\t} else if (m === 6) {\n\t\t\tif (fresh) { pool = []; lastUrn = -1; }\n\t\t\tif (pool.length === 0) {\n\t\t\t\tfor (var i = 0; i < R; i++) pool.push(i);\n\t\t\t}\n\t\t\tvar k;\n\t\t\tif (pool.length === R && R > 1 && lastUrn >= 0 && lastUrn < R) {\n\t\t\t\t// first draw after a refill: never repeat the number that ended the last round\n\t\t\t\tk = randInt(R - 1);\n\t\t\t\tif (pool[k] === lastUrn) k = R - 1;\n\t\t\t} else k = randInt(pool.length);\n\t\t\tu = pool[k];\n\t\t\tpool.splice(k, 1);\n\t\t\tcarry = pool.length === 0;\n\t\t\tlastUrn = u;\n\t\t} else if (m === 7) {\n\t\t\t// no carry: a drunk walk has no last count\n\t\t\tif (fresh) u = 0;\n\t\t\telse {\n\t\t\t\tvar r = randInt(2 * st);\n\t\t\t\tvar d = r < st ? r - st : r - st + 1;   // -step..-1, 1..step (always moves)\n\t\t\t\tu = foldA(cur + d, E);\n\t\t\t\tdir = d > 0 ? 1 : -1;\n\t\t\t}\n\t\t}\n\n\t\t// permutation (forward/backward/palindromes): without fold it rotates the count inside 0..max;\n\t\t// with fold it slides the whole fold window up (fold max 2, permutation 2 = counts 2..4), wrapping at max\n\t\tvar permMode = (m >= 1 && m <= 4);\n\t\tvar folding = S.foldmax > 0;\n\t\tvar f = u, out;\n\t\tif (isModulo() && m !== 0) {\n\t\t\tvar N1 = S.foldmax + 1;\n\t\t\tf = u % N1;\n\t\t\t// carry on the last count before the folded loop restarts\n\t\t\tif (nextU >= 0 && Math.floor(nextU / N1) !== Math.floor(u / N1)) carry = true;\n\t\t}\n\t\tif (!permMode) out = f;\n\t\telse if (folding) out = wrap(f + S.perm, S.max + 1);\n\t\telse out = wrap(u + S.perm, R);\n\n\t\t// modes without the permutation offset still leave idx where they are,\n\t\t// so forward/backward/palindrome pick up from here\n\t\tif (!permMode) idx = (folding || m === 0) ? wrap(u, R) : wrap(u - S.perm, R);\n\t\tcur = (permMode && !folding) ? wrap(u + S.perm, R) : wrap(u, R);\n\t\tfresh = false;\n\t\tlastMode = m;\n\n\t\toutlet(2, master);\n\t\toutlet(0, out);\n\t\tif (carry) outlet(1, \"bang\");\n\t}\n\n\t// settings and reset arrive by name; handled here (not as global functions) because v8 already owns names like max\n\tfunction setting(name, v) {\n\t\tswitch (name) {\n\t\t\tcase \"mode\": S.mode = Math.min(Math.max(Math.trunc(v), 0), 7); return true;\n\t\t\tcase \"max\": S.max = Math.min(Math.max(Math.trunc(v), 0), 100000); return true;\n\t\t\tcase \"step\": S.step = Math.max(Math.trunc(v), 1); return true;\n\t\t\tcase \"permutation\": S.perm = Math.trunc(v); return true;\n\t\t\tcase \"fold\": S.fold = Math.min(Math.max(Math.trunc(v), 0), 1); return true;\n\t\t\tcase \"foldmax\": S.foldmax = Math.min(Math.max(Math.trunc(v), 0), 100000); return true;\n\t\t\tcase \"seed\": S.seed = Math.trunc(v); rng = makeRng(S.seed); return true;\n\t\t}\n\t\treturn false;\n\t}\n\n\tfunction reset() {\n\t\tfresh = true;\n\t\tmasterFresh = true;\n\t\tcur = 0; idx = 0; dir = 1; ph = 0; master = 0;\n\t\tpool = []; lastUrn = -1; lastMode = -1; rederive = false;\n\t\tif (S.seed) rng = makeRng(S.seed);\n\t}\n\n\treturn {\n\t\tbang: function () { stepMaster(); advance(); },\n\t\tcount: function (v) { stepMaster(v); advance(); },\n\t\tsetting: setting,\n\t\treset: reset\n\t};\n})();\n\n// --- input ---\nvar SETTING_INLETS = [null, \"mode\", \"max\", \"step\", \"permutation\", \"fold\", \"foldmax\"];\n\nfunction bang() {\n\tif (inlet === 0) BRC.bang();\n}\n\nfunction msg_int(v) {\n\tif (inlet === 0) BRC.count(v);\n\telse BRC.setting(SETTING_INLETS[inlet], v);\n}\n\nfunction msg_float(v) { msg_int(Math.trunc(v)); }\n\nfunction anything() {\n\tvar args = arrayfromargs(arguments);\n\tif (messagename === \"reset\") BRC.reset();\n\telse if (messagename === \"done\") return;   // patcherargs sends this after the attributes\n\telse if (!(args.length && BRC.setting(messagename, Number(args[0]))))\n\t\tpost(\"br.counter: unknown message \" + messagename + \"\\n\");\n}\n",
                    "saved_object_attributes": {
                        "parameter_enable": 0
                    }
                }
            },
            {
                "box": {
                    "maxclass": "inlet",
                    "id": "obj-fold",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        365,
                        15,
                        30.0,
                        30.0
                    ],
                    "comment": "Fold (Int, set only) 0 = Modulo: the count folded into 0..Fold Max, restarting with the main cycle. 1 = Poly: the mode runs inside 0..Fold Max and loops on its own, ignoring Max. Default 0 (or @fold)"
                }
            },
            {
                "box": {
                    "maxclass": "inlet",
                    "id": "obj-foldmax",
                    "numinlets": 0,
                    "numoutlets": 1,
                    "outlettype": [
                        ""
                    ],
                    "patching_rect": [
                        435,
                        15,
                        30.0,
                        30.0
                    ],
                    "comment": "Fold Max (Int, set only) highest count of the fold, same rule as Max (4 = 0-4). 0 = Fold off. Default 0 (or @foldmax)"
                }
            }
        ],
        "lines": [
            {
                "patchline": {
                    "source": [
                        "obj-8",
                        0
                    ],
                    "destination": [
                        "obj-9",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-2",
                        0
                    ],
                    "destination": [
                        "obj-code",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-3",
                        0
                    ],
                    "destination": [
                        "obj-code",
                        1
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-4",
                        0
                    ],
                    "destination": [
                        "obj-code",
                        2
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-5",
                        0
                    ],
                    "destination": [
                        "obj-code",
                        3
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-7",
                        0
                    ],
                    "destination": [
                        "obj-code",
                        4
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-9",
                        0
                    ],
                    "destination": [
                        "obj-code",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-8",
                        1
                    ],
                    "destination": [
                        "obj-code",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-code",
                        0
                    ],
                    "destination": [
                        "obj-10",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-code",
                        1
                    ],
                    "destination": [
                        "obj-11",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-code",
                        2
                    ],
                    "destination": [
                        "obj-12",
                        0
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-fold",
                        0
                    ],
                    "destination": [
                        "obj-code",
                        5
                    ]
                }
            },
            {
                "patchline": {
                    "source": [
                        "obj-foldmax",
                        0
                    ],
                    "destination": [
                        "obj-code",
                        6
                    ]
                }
            }
        ],
        "dependency_cache": [],
        "autosave": 0
    }
}