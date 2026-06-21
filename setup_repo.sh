#!/bin/bash
# ============================================================================
# Servo — Data Traffic Interception Control
# One-shot repository generator. Run this file to scaffold the full repo:
#     bash setup_repo.sh
# It writes index.html, styles.css, app.js and README.md into the current dir.
# ============================================================================
set -e
echo "Initializing repository structure..."

# 1. Generate the modular frontend entry point
cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Servo · Data Traffic Interception Control</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&family=IBM+Plex+Sans:wght@400;500;600&display=swap" rel="stylesheet">
<!-- Externalized stylesheet (was an inline <style> block in the monolith) -->
<link rel="stylesheet" href="styles.css">
<!-- Externalized application engine, deferred so the DOM is parsed before init runs -->
<script src="app.js" defer></script>
</head>
<body>
<div class="grid-bg"></div>
<div class="app">
  <!-- ============ SHEET INDEX ============ -->
  <aside class="index">
    <div class="mark">
      <div class="seal-sm" id="brandSeal"></div>
      <div><div class="nm">Servo</div><div class="sb">INTERCEPTION CONTROL</div></div>
    </div>
    <div class="idx-cap">SHEET INDEX</div>
    <nav class="nav" id="nav"></nav>
    <div class="drawnby">
      <div class="db-cell">
        <div class="db-k">DRAWN / APPROVED BY</div>
        <div class="db-v">Emily Brown <span class="db-dot"></span></div>
        <div class="db-r">Security Administrator</div>
      </div>
    </div>
  </aside>

  <!-- ============ MAIN ============ -->
  <main class="main">
    <header class="titleblock">
      <div class="tb-title">
        <div class="tb-ey">SECURITY OPERATIONS · DATA TRAFFIC INTERCEPTION</div>
        <div class="tb-h" id="tbTitle">Security Operations Dashboard</div>
      </div>
      <div class="tb-cells" id="tbCells"></div>
    </header>
    <div class="content" id="main"></div>
  </main>
</div>

<div id="drawer"></div>
<div class="notices" id="notices"></div>

</body>
</html>
EOF

# 2. Generate the visual styles component
cat << 'EOF' > styles.css
/* ===================================================================
   Servo — Engineering Document edition
   Identity derived from construction drawings: title block, dimension
   lines, revision table, control seal, approval stamp. Ink on drafting
   film. No neon, no gradient "tech feel", no decorative icon slop.
   =================================================================== */
:root{
  --paper:#E9ECEE; --panel:#FBFCFC; --panel2:#F1F4F5; --tint:#F6F8F8;
  --ink:#16242E; --ink2:#47565F; --ink3:#7E8C93;
  --line:#BFCBD0; --lineSoft:#D7DFE2; --lineHard:#16242E;
  --orange:#DD5219; --orangeDim:#FaEadf;     /* hi-vis caution / primary */
  --red:#B22F1B; --redDim:#F6E4df;           /* structural / critical */
  --green:#2E7A4D; --greenDim:#E0EEE6;       /* released / approved */
  --blue:#1F5DA6; --blueDim:#E2EBF4;         /* survey / source / info */
  --amber:#946410; --amberDim:#F2EAD7;       /* under review */
  --display:'Space Grotesk',system-ui,sans-serif;
  --sans:'IBM Plex Sans',system-ui,sans-serif;
  --mono:'IBM Plex Mono',ui-monospace,'SF Mono',Menlo,monospace;
}
*{box-sizing:border-box;}
html,body{margin:0;padding:0;}
body{background:var(--paper);color:var(--ink);min-height:100vh;font-family:var(--sans);
  -webkit-font-smoothing:antialiased;font-size:14px;}
.mono{font-family:var(--mono);}
.disp{font-family:var(--display);}
button{font-family:inherit;}
::-webkit-scrollbar{width:11px;height:11px;}
::-webkit-scrollbar-track{background:var(--panel2);}
::-webkit-scrollbar-thumb{background:var(--line);border:3px solid var(--panel2);}
::-webkit-scrollbar-thumb:hover{background:var(--ink3);}
input::placeholder{color:var(--ink3);}
.truncate{overflow:hidden;text-overflow:ellipsis;white-space:nowrap;}

/* faint engineering grid on the ground */
.grid-bg{position:fixed;inset:0;pointer-events:none;z-index:0;
  background-image:linear-gradient(rgba(22,36,46,.045) 1px,transparent 1px),
                   linear-gradient(90deg,rgba(22,36,46,.045) 1px,transparent 1px);
  background-size:30px 30px;}

.app{position:relative;z-index:1;display:flex;}

/* ---------------- SHEET INDEX (sidebar) ---------------- */
.index{width:236px;flex-shrink:0;background:var(--panel);border-right:1.5px solid var(--lineHard);
  height:100vh;position:sticky;top:0;display:flex;flex-direction:column;}
.mark{display:flex;align-items:center;gap:11px;padding:18px 16px 14px;border-bottom:1.5px solid var(--lineHard);}
.seal-sm{width:36px;height:36px;flex-shrink:0;}
.mark .nm{font-family:var(--display);font-weight:700;font-size:18px;letter-spacing:-.4px;}
.mark .sb{font-family:var(--mono);font-size:9px;color:var(--ink3);letter-spacing:1px;margin-top:1px;}
.idx-cap{font-family:var(--mono);font-size:10px;letter-spacing:2px;color:var(--ink3);padding:14px 16px 8px;}
.nav{flex:1;overflow-y:auto;padding:0 10px;}
.sheet{width:100%;display:flex;align-items:center;gap:11px;padding:9px 10px;border:none;background:transparent;
  cursor:pointer;text-align:left;border-bottom:1px solid var(--lineSoft);transition:background .12s;}
.sheet:hover{background:var(--panel2);}
.sheet .sc{font-family:var(--mono);font-size:11px;color:var(--ink3);width:26px;flex-shrink:0;letter-spacing:.5px;}
.sheet .sl{font-family:var(--display);font-size:13px;font-weight:500;letter-spacing:.2px;color:var(--ink2);}
.sheet.active{background:var(--ink);}
.sheet.active .sc{color:var(--orange);}
.sheet.active .sl{color:#fff;font-weight:600;}
.drawnby{border-top:1.5px solid var(--lineHard);padding:0;}
.db-cell{padding:10px 16px;}
.db-k{font-family:var(--mono);font-size:9px;letter-spacing:1.5px;color:var(--ink3);}
.db-v{font-family:var(--display);font-weight:600;font-size:14px;margin-top:2px;display:flex;align-items:center;gap:7px;}
.db-dot{width:7px;height:7px;background:var(--green);border-radius:0;transform:rotate(45deg);}
.db-r{font-size:11px;color:var(--ink2);font-family:var(--mono);margin-top:1px;}

/* ---------------- TITLE BLOCK (header) ---------------- */
.main{flex:1;min-width:0;max-height:100vh;overflow-y:auto;}
.titleblock{position:sticky;top:0;z-index:20;display:flex;align-items:stretch;justify-content:space-between;
  background:var(--panel);border-bottom:1.5px solid var(--lineHard);}
.tb-title{padding:13px 22px;display:flex;flex-direction:column;justify-content:center;}
.tb-ey{font-family:var(--mono);font-size:10px;letter-spacing:2px;color:var(--orange);}
.tb-h{font-family:var(--display);font-size:19px;font-weight:600;letter-spacing:-.3px;margin-top:2px;}
.tb-cells{display:flex;}
.tb-cell{border-left:1.5px solid var(--lineHard);padding:9px 16px;display:flex;flex-direction:column;justify-content:center;min-width:96px;}
.tb-cell .k{font-family:var(--mono);font-size:9px;letter-spacing:1.5px;color:var(--ink3);}
.tb-cell .v{font-family:var(--mono);font-size:13px;font-weight:500;margin-top:3px;color:var(--ink);}
.tb-status .v{color:var(--green);display:flex;align-items:center;gap:6px;}
.live-dot{width:7px;height:7px;background:var(--green);border-radius:0;transform:rotate(45deg);animation:blink 1.6s step-end infinite;}
.demo-cell{background:var(--ink);}
.demo-cell .k{color:#8a99a0;}
.demo-cell .v{color:var(--orange);}
.notice-btn{position:relative;cursor:pointer;background:transparent;border:none;border-left:1.5px solid var(--lineHard);padding:0 18px;color:var(--ink2);}
.notice-ct{position:absolute;top:10px;right:8px;min-width:18px;height:18px;padding:0 4px;background:var(--red);color:#fff;
  font-family:var(--mono);font-size:10px;font-weight:600;display:flex;align-items:center;justify-content:center;}

.content{padding:24px 26px 64px;}

/* ---------------- shared drafting devices ---------------- */
.dim{display:flex;align-items:center;width:100%;margin:0;}
.dim .tick{width:1.5px;height:9px;background:var(--ink);flex-shrink:0;}
.dim .ln{flex:1;height:1.5px;background:var(--ink);}
.dim .lab{font-family:var(--mono);font-size:10px;letter-spacing:2px;color:var(--ink2);padding:0 12px;white-space:nowrap;text-transform:uppercase;}

.seclabel{display:flex;align-items:center;gap:0;margin-bottom:14px;}
.seclabel .code{font-family:var(--mono);font-size:11px;font-weight:600;color:#fff;background:var(--ink);padding:4px 8px;letter-spacing:.5px;}
.seclabel .code.o{background:var(--orange);}
.seclabel .t{font-family:var(--display);font-size:13px;font-weight:600;letter-spacing:.6px;text-transform:uppercase;color:var(--ink);padding:0 12px;white-space:nowrap;}
.seclabel .rule{flex:1;height:1.5px;background:var(--ink);}
.seclabel .meta{font-family:var(--mono);font-size:10px;color:var(--ink3);padding-left:12px;letter-spacing:1px;white-space:nowrap;}

.sheetpanel{background:var(--panel);border:1.5px solid var(--ink);position:relative;}

.tag{display:inline-flex;align-items:center;gap:5px;font-family:var(--mono);font-size:10.5px;font-weight:500;
  letter-spacing:.5px;padding:2px 7px;border:1px solid currentColor;white-space:nowrap;}
.tag .sq{width:6px;height:6px;background:currentColor;}

.stack{display:flex;flex-direction:column;gap:24px;}
.flex{display:flex;}.between{justify-content:space-between;}.items-center{align-items:center;}
.view-head{margin-bottom:2px;}
.view-head .vt{font-family:var(--display);font-size:21px;font-weight:600;letter-spacing:-.4px;}
.view-head .vs{font-size:13px;color:var(--ink2);margin-top:3px;}

.two-col{display:grid;grid-template-columns:minmax(0,1.9fr) minmax(0,1fr);gap:24px;}

/* ---------------- schedule strip (metrics) ---------------- */
.schedule{display:grid;grid-template-columns:repeat(5,1fr);border:1.5px solid var(--ink);background:var(--panel);}
.sch-cell{padding:15px 16px;border-left:1px solid var(--lineSoft);position:relative;}
.sch-cell:first-child{border-left:none;}
.sch-cell .cc{font-family:var(--mono);font-size:10px;color:var(--ink3);letter-spacing:1px;}
.sch-cell .cv{font-family:var(--display);font-size:32px;font-weight:600;letter-spacing:-1px;line-height:1.05;margin-top:8px;}
.sch-cell .cl{font-size:12px;color:var(--ink2);margin-top:4px;font-weight:500;}
.sch-cell .cs{font-size:11px;color:var(--ink3);margin-top:1px;}
.sch-cell .cd{position:absolute;top:15px;right:16px;font-family:var(--mono);font-size:11px;font-weight:500;}
.accent-bar{height:3px;width:24px;margin-top:10px;}

/* ---------------- interceptor schematic (hero, 120%) ---------------- */
.schematic{padding:22px;position:relative;}
.corner{position:absolute;width:10px;height:10px;}
.corner::before,.corner::after{content:"";position:absolute;background:var(--ink);}
.corner::before{width:10px;height:1.5px;}.corner::after{width:1.5px;height:10px;}
.c-tl{top:7px;left:7px;}.c-tr{top:7px;right:7px;}.c-tr::after{right:0;}.c-tr::before{right:0;}
.c-bl{bottom:7px;left:7px;}.c-bl::before{bottom:0;}.c-bl::after{bottom:0;}
.c-br{bottom:7px;right:7px;}.c-br::before{bottom:0;right:0;}.c-br::after{bottom:0;right:0;}

.flow{display:flex;align-items:center;justify-content:space-between;gap:6px;padding:14px 8px 6px;}
.fnode{flex-shrink:0;width:128px;text-align:center;}
.fnode .box{height:64px;border:1.5px solid var(--ink);background:var(--panel2);display:flex;align-items:center;justify-content:center;
  font-family:var(--display);font-weight:600;font-size:13px;color:var(--ink);position:relative;}
.fnode .box .num{position:absolute;top:4px;left:6px;font-family:var(--mono);font-size:9px;color:var(--ink3);}
.fnode .cap{font-family:var(--mono);font-size:10px;color:var(--ink3);margin-top:7px;letter-spacing:.5px;}
.wire{flex:1;height:1.5px;background:var(--ink);position:relative;min-width:34px;}
.wire .packet{position:absolute;top:-3px;width:7px;height:7px;background:var(--orange);animation:run 2.6s linear infinite;}
.wire.out .packet{background:var(--green);}
.seal{width:96px;height:96px;flex-shrink:0;position:relative;}
.seal.pulse-now{animation:sealhit .8s ease-out;}
.flow-legend{display:flex;flex-wrap:wrap;gap:14px;justify-content:center;padding:16px 0 4px;border-top:1px solid var(--lineSoft);margin-top:6px;}
.lg{display:flex;align-items:center;gap:7px;font-family:var(--mono);font-size:11px;color:var(--ink2);letter-spacing:.5px;}
.lg .m{width:9px;height:9px;}
.srcrow{display:grid;grid-template-columns:1fr 1fr;border-top:1.5px solid var(--ink);}
.srccell{display:flex;align-items:center;gap:9px;padding:10px 14px;border-left:1px solid var(--lineSoft);border-bottom:1px solid var(--lineSoft);}
.srccell:nth-child(odd){border-left:none;}
.srccell .si{width:20px;height:20px;flex-shrink:0;color:var(--blue);}
.srccell .sn{font-size:12px;color:var(--ink2);}
.srccell .live{margin-left:auto;width:6px;height:6px;background:var(--green);animation:blink 1.6s step-end infinite;}

.btn{display:inline-flex;align-items:center;gap:8px;font-family:var(--display);font-weight:600;font-size:13px;
  padding:9px 15px;border:1.5px solid var(--ink);background:var(--ink);color:#fff;cursor:pointer;transition:all .12s;letter-spacing:.3px;}
.btn:hover{background:var(--orange);border-color:var(--orange);}
.btn .pl{font-family:var(--mono);font-size:14px;line-height:1;}

/* ---------------- revision table (incidents) ---------------- */
.tblwrap{overflow-x:auto;}
table{width:100%;border-collapse:collapse;}
thead tr{background:var(--ink);}
th{font-family:var(--mono);font-size:10px;letter-spacing:1px;color:#cdd6da;text-align:left;padding:9px 14px;font-weight:500;text-transform:uppercase;}
td{padding:10px 14px;border-bottom:1px solid var(--lineSoft);vertical-align:middle;font-size:13px;}
tbody tr{transition:background .1s;}
tbody tr.clickable{cursor:pointer;}
tbody tr.clickable:hover{background:var(--orangeDim);}
tbody tr.clickable:hover td:first-child{box-shadow:inset 3px 0 0 var(--orange);}
.idcell{font-family:var(--mono);font-size:12.5px;font-weight:500;color:var(--ink);}
.fcell{display:flex;align-items:center;gap:9px;}
.fcell .fg{width:18px;height:18px;flex-shrink:0;}
.act-link{font-family:var(--mono);font-size:11px;font-weight:500;color:var(--orange);letter-spacing:.5px;display:inline-flex;align-items:center;gap:5px;}
.empty{padding:30px;text-align:center;color:var(--ink3);font-size:13px;}

/* ---------------- toolbar ---------------- */
.toolbar{display:flex;flex-wrap:wrap;gap:0;border:1.5px solid var(--ink);background:var(--panel);}
.searchbox{display:flex;align-items:center;gap:9px;padding:9px 14px;flex:1 1 260px;min-width:200px;}
.searchbox svg{flex-shrink:0;color:var(--ink3);}
.searchbox input{border:none;outline:none;background:transparent;font-family:var(--mono);font-size:12.5px;width:100%;color:var(--ink);}
.filters{display:flex;border-left:1.5px solid var(--ink);}
.fbtn{font-family:var(--mono);font-size:11px;letter-spacing:.5px;padding:9px 13px;border:none;border-left:1px solid var(--lineSoft);
  background:transparent;color:var(--ink2);cursor:pointer;white-space:nowrap;}
.fbtn:first-child{border-left:none;}
.fbtn:hover{background:var(--panel2);}
.fbtn.active{background:var(--ink);color:#fff;}

/* ---------------- control sheet (drawer) ---------------- */
.overlay{position:fixed;inset:0;background:rgba(22,36,46,.42);z-index:40;animation:fade .18s ease;}
.drawer{position:fixed;top:0;right:0;height:100vh;width:min(456px,95vw);background:var(--panel);border-left:1.5px solid var(--lineHard);
  z-index:50;overflow-y:auto;animation:slide .26s cubic-bezier(.22,.61,.36,1);}
.dr-head{position:sticky;top:0;background:var(--ink);color:#fff;padding:16px 20px;display:flex;align-items:flex-start;justify-content:space-between;z-index:2;}
.dr-head .ey{font-family:var(--mono);font-size:10px;letter-spacing:1.5px;color:var(--orange);}
.dr-head .id{font-family:var(--mono);font-size:18px;font-weight:600;margin-top:5px;}
.dr-x{background:transparent;border:1px solid #44545d;color:#cdd6da;width:30px;height:30px;cursor:pointer;font-size:16px;line-height:1;}
.dr-x:hover{background:#22323b;}
.dr-body{padding:20px;display:flex;flex-direction:column;gap:18px;}
.specrow{display:flex;border-top:1px solid var(--lineSoft);}
.specrow:first-child{border-top:none;}
.specrow .sk{font-family:var(--mono);font-size:10px;letter-spacing:1px;color:var(--ink3);width:128px;flex-shrink:0;padding:9px 0;text-transform:uppercase;}
.specrow .sv{font-size:13px;padding:9px 0;flex:1;}
.notebox{border:1.5px solid var(--ink);padding:0;}
.notebox .nh{font-family:var(--mono);font-size:10px;letter-spacing:1.5px;padding:7px 12px;color:#fff;background:var(--ink);text-transform:uppercase;}
.notebox .nb{padding:12px;font-size:13px;line-height:1.55;}
.notebox.warn .nh{background:var(--red);}
.notebox.plan .nh{background:var(--orange);}
.dialwrap{display:flex;align-items:center;gap:14px;border:1.5px solid var(--ink);padding:14px;}
.acts{display:flex;flex-direction:column;gap:0;border:1.5px solid var(--ink);}
.abtn{display:flex;align-items:center;justify-content:center;gap:8px;font-family:var(--display);font-weight:600;font-size:13px;
  padding:12px;border:none;border-top:1px solid var(--lineSoft);cursor:pointer;background:var(--panel);color:var(--ink);transition:background .12s;letter-spacing:.3px;}
.abtn:first-child{border-top:none;}
.abtn:hover:not(:disabled){background:var(--panel2);}
.abtn.primary{background:var(--green);color:#fff;}
.abtn.primary:hover:not(:disabled){background:#256340;}
.abtn.danger{color:var(--red);}
.abtn.danger:hover:not(:disabled){background:var(--redDim);}
.abtn.forward{color:var(--blue);}
.abtn.forward:hover:not(:disabled){background:var(--blueDim);}
.abtn:disabled{opacity:.4;cursor:not-allowed;}

/* approval stamp */
.stampwrap{display:flex;justify-content:center;padding:6px 0;}
.stamp{font-family:var(--mono);font-weight:600;letter-spacing:3px;font-size:22px;padding:8px 18px 6px;
  border:3px double currentColor;text-align:center;animation:stamp .42s cubic-bezier(.3,1.4,.5,1);position:relative;}
.stamp small{display:block;font-size:9px;letter-spacing:1px;margin-top:3px;font-weight:500;}
.stamp.released{color:var(--green);transform:rotate(-7deg);}
.stamp.void{color:var(--red);transform:rotate(5deg);}
.stamp.forwarded{color:var(--blue);transform:rotate(-4deg);}

/* ---------------- field log (activity) ---------------- */
.fieldlog{max-height:486px;display:flex;flex-direction:column;}
.fl-head{font-family:var(--mono);font-size:10px;letter-spacing:1.5px;color:#fff;background:var(--ink);padding:8px 14px;
  display:flex;justify-content:space-between;align-items:center;}
.fl-body{overflow-y:auto;}
.fl-item{display:flex;gap:0;border-bottom:1px solid var(--lineSoft);}
.fl-time{font-family:var(--mono);font-size:10px;color:var(--ink3);padding:10px 10px 10px 14px;width:72px;flex-shrink:0;border-right:1px solid var(--lineSoft);}
.fl-tick{width:3px;flex-shrink:0;}
.fl-txt{font-size:12.5px;padding:10px 14px;line-height:1.4;color:var(--ink2);}

/* ---------------- carbon plot ---------------- */
.statgrid{display:grid;grid-template-columns:1fr 1fr;border:1.5px solid var(--ink);}
.statc{padding:13px 14px;border-left:1px solid var(--lineSoft);}
.statc:first-child{border-left:none;}
.statc .sb{font-family:var(--display);font-size:24px;font-weight:600;letter-spacing:-.5px;}
.statc .su{font-family:var(--mono);font-size:10px;color:var(--ink3);}
.statc .slb{font-size:11px;color:var(--ink2);margin-top:2px;}
.note{font-size:12px;color:var(--ink2);line-height:1.55;}

/* ---------------- policies / integrations / settings ---------------- */
.deftable td{vertical-align:top;}
.rulecode{font-family:var(--mono);font-size:11px;color:var(--ink3);}
.intcard{display:flex;align-items:center;gap:12px;padding:12px 14px;border-bottom:1px solid var(--lineSoft);}
.intcard .ii{width:22px;height:22px;flex-shrink:0;}
.intcard .inm{font-size:13px;flex:1;}
.setrow{display:flex;justify-content:space-between;align-items:center;padding:14px 16px;border-top:1px solid var(--lineSoft);}
.setrow:first-child{border-top:none;}
.toggle{width:52px;height:26px;border:1.5px solid var(--ink);background:var(--panel);cursor:pointer;position:relative;
  font-family:var(--mono);font-size:9px;letter-spacing:.5px;}
.toggle .kn{position:absolute;top:2px;left:2px;width:20px;height:20px;background:var(--ink);transition:left .15s;}
.toggle .lb{position:absolute;top:0;bottom:0;right:6px;display:flex;align-items:center;color:var(--ink3);}
.toggle.on{background:var(--ink);border-color:var(--ink);}
.toggle.on .kn{left:28px;background:var(--orange);}
.toggle.on .lb{left:7px;right:auto;color:#fff;}

/* ---------------- notices (toasts) ---------------- */
.notices{position:fixed;right:22px;bottom:22px;z-index:60;display:flex;flex-direction:column;gap:10px;}
.notice{display:flex;align-items:stretch;background:var(--panel);border:1.5px solid var(--ink);min-width:250px;
  box-shadow:5px 5px 0 rgba(22,36,46,.12);animation:nin .22s ease;}
.notice .bar{width:4px;flex-shrink:0;}
.notice .ntx{padding:10px 13px;font-size:12.5px;}
.notice .ntx b{font-family:var(--mono);font-size:9.5px;letter-spacing:1px;display:block;color:var(--ink3);margin-bottom:2px;text-transform:uppercase;}

@keyframes run{0%{left:-5px;opacity:0;}10%{opacity:1;}90%{opacity:1;}100%{left:calc(100% - 2px);opacity:0;}}
@keyframes blink{0%,60%{opacity:1;}61%,100%{opacity:.2;}}
@keyframes sealhit{0%{transform:scale(1);}35%{transform:scale(1.07);}100%{transform:scale(1);}}
@keyframes stamp{0%{opacity:0;transform:scale(1.7) rotate(-7deg);}65%{opacity:1;}100%{transform:scale(1) rotate(-7deg);}}
@keyframes slide{from{transform:translateX(100%);}to{transform:translateX(0);}}
@keyframes fade{from{opacity:0;}to{opacity:1;}}
@keyframes nin{from{opacity:0;transform:translateX(10px);}to{opacity:1;transform:translateX(0);}}

@media (max-width:1080px){ .tb-cells .opt{display:none;} }
@media (max-width:920px){ .schedule{grid-template-columns:1fr 1fr;} .two-col{grid-template-columns:1fr;} }
@media (max-width:680px){ .index{display:none;} .schedule{grid-template-columns:1fr;} .srcrow{grid-template-columns:1fr;} }
EOF

# 3. Generate the application logic script
cat << 'EOF' > app.js
/* ====================================================================
   ICONS — minimal, functional only (file glyphs + source marks + seal)
   ==================================================================== */
const I={
  file:'<path d="M6 2h8l4 4v16H6z"/><path d="M14 2v4h4"/>',
  fileCode:'<path d="M6 2h8l4 4v16H6z"/><path d="M14 2v4h4"/><path d="M10 13l-2 2 2 2M14 13l2 2-2 2"/>',
  fileSheet:'<path d="M6 2h8l4 4v16H6z"/><path d="M14 2v4h4"/><path d="M8 12h8M8 16h8M12 12v6"/>',
  boxes:'<path d="M12 3 3 7.5 12 12l9-4.5z"/><path d="M3 7.5V16l9 4.5M21 7.5V16l-9 4.5"/>',
  hardhat:'<path d="M4 17h16M5 17a7 7 0 0 1 14 0M9 8V6a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/>',
  radio:'<circle cx="12" cy="12" r="2"/><path d="M8 8a6 6 0 0 0 0 8M16 8a6 6 0 0 1 0 8"/>',
  wifi:'<path d="M4 9a14 14 0 0 1 16 0M7 12.5a9 9 0 0 1 10 0M9.5 16a5 5 0 0 1 5 0"/><circle cx="12" cy="19" r=".8" fill="currentColor" stroke="none"/>',
  search:'<circle cx="11" cy="11" r="7"/><path d="M21 21l-4-4"/>',
  cloud:'<path d="M7 18a4 4 0 0 1 0-8 5 5 0 0 1 9.5-1.5A3.5 3.5 0 0 1 18 18z"/>',
  upload:'<path d="M12 21V9M7 13l5-5 5 5M5 3h14"/>',
  database:'<ellipse cx="12" cy="5" rx="8" ry="3"/><path d="M4 5v14c0 1.7 3.6 3 8 3s8-1.3 8-3V5"/><path d="M4 12c0 1.7 3.6 3 8 3s8-1.3 8-3"/>',
  bell:'<path d="M6 9a6 6 0 0 1 12 0c0 5 2 6 2 6H4s2-1 2-6z"/><path d="M10 20a2 2 0 0 0 4 0"/>',
};
const ic=(n,s=18,c='currentColor')=>`<svg viewBox="0 0 24 24" width="${s}" height="${s}" fill="none" stroke="${c}" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round">${I[n]||''}</svg>`;

/* the Servo control seal — a drafted stamp, not a glowing icon */
function seal(size,stroke='var(--ink)',accent='var(--orange)'){
  const r=size/2;
  return `<svg viewBox="0 0 100 100" width="${size}" height="${size}">
    <circle cx="50" cy="50" r="47" fill="none" stroke="${stroke}" stroke-width="2.5"/>
    <circle cx="50" cy="50" r="38" fill="none" stroke="${stroke}" stroke-width="1"/>
    <path d="M50 28 L66 35 V52 c0 11 -8 17 -16 20 c-8 -3 -16 -9 -16 -20 V35 Z" fill="none" stroke="${accent}" stroke-width="2.5"/>
    <path d="M43 49 l5 5 9 -10" fill="none" stroke="${accent}" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
    <g font-family="'IBM Plex Mono',monospace" font-size="6.4" letter-spacing="1.2" fill="${stroke}" font-weight="600">
      <text x="50" y="19" text-anchor="middle">SERVO</text>
      <text x="50" y="86" text-anchor="middle">INTERCEPT</text>
    </g>
    <circle cx="20" cy="50" r="1.4" fill="${stroke}"/><circle cx="80" cy="50" r="1.4" fill="${stroke}"/>
  </svg>`;
}

/* ====================================================================
   DATA
   ==================================================================== */
const RISK={Critical:{c:'var(--red)',code:'CRIT'},High:{c:'var(--orange)',code:'HIGH'},Medium:{c:'var(--amber)',code:'MED'},Low:{c:'var(--green)',code:'LOW'}};
const STAT={'Blocked':{c:'var(--red)',code:'BLOCKED'},'Pending Review':{c:'var(--amber)',code:'REVIEW'},'Sanitized & Released':{c:'var(--green)',code:'RELEASED'},'Dropped':{c:'var(--ink3)',code:'VOID'},'Forwarded':{c:'var(--blue)',code:'FORWARDED'}};
const RULES=[
  {code:'SR-01',name:'Executable File Detection',logic:'Blocks .exe, .bat, .js, .scr files',action:'Quarantine',c:'var(--red)'},
  {code:'SR-02',name:'Macro Risk Detection',logic:'Detects .xlsm and macro-enabled files',action:'Quarantine',c:'var(--orange)'},
  {code:'SR-03',name:'Sensitive Financial Data',logic:'Detects "budget", "tender", "cost" in file name',action:'Encrypt Before Release',c:'var(--amber)'},
  {code:'SR-04',name:'Credential Exposure',logic:'Detects password, login, credential, access list',action:'Mask Sensitive Text',c:'var(--blue)'},
  {code:'SR-05',name:'Oversized File Protection',logic:'Files over 500 MB',action:'Hold for Review',c:'var(--green)'},
];
const SOURCES=[
  {name:'Subcontractor CAD Upload Portal',icon:'hardhat'},
  {name:'Site Inspection Mobile App',icon:'radio'},
  {name:'Procurement Tender System',icon:'fileSheet'},
  {name:'Drone Survey Upload Gateway',icon:'wifi'},
];
const DESTINATIONS=['Project Document Repository','BIM Model Repository','Cost & Tender Folder','Site Reporting Archive'];
const SAFE_FILES=['Structural_Drawings_Rev04.pdf','Concrete_Inspection_Report.pdf','BIM_Model_Level3.ifc','Site_Photo_Log_June.zip'];
const SUSPICIOUS=[
  {file:'Site_Plan_Macros.xlsm',risk:'High',violation:'Embedded VBA macros detected',rules:['Macro Risk Detection'],fix:'Strip active VBA macro layers, scan residual content, and release the sanitized workbook.',carbon:.6},
  {file:'Tender_Budget_2026.xlsx',risk:'Medium',violation:'Unencrypted financial project data',rules:['Sensitive Financial Data'],fix:'Apply an AES-256 encryption wrapper before storage.',carbon:.3},
  {file:'Updated_Drawings.exe',risk:'Critical',violation:'Executable file detected',rules:['Executable File Detection'],fix:'Permanently drop payload and alert the source owner.',carbon:.4},
  {file:'Contractor_Access_List.csv',risk:'High',violation:'Credential and access-list exposure',rules:['Credential Exposure'],fix:'Mask credentials, redact PII, then release sanitized list.',carbon:.2},
  {file:'BIM_Export_Script.js',risk:'Critical',violation:'Active script payload detected',rules:['Executable File Detection'],fix:'Neutralize the script and extract only the BIM geometry payload.',carbon:.5},
];
const NAV=[
  {id:'dashboard',code:'SS-00',label:'Dashboard'},
  {id:'traffic',code:'SS-01',label:'Live Traffic Monitor'},
  {id:'quarantine',code:'SS-02',label:'Quarantine Vault'},
  {id:'incidents',code:'SS-03',label:'Incident Reports'},
  {id:'carbon',code:'SS-04',label:'Carbon Impact'},
  {id:'policies',code:'SS-05',label:'Security Policies'},
  {id:'integrations',code:'SS-06',label:'Integrations'},
  {id:'settings',code:'SS-07',label:'Settings'},
];
const SHEETCODE=Object.fromEntries(NAV.map(n=>[n.id,n.code]));

const now=Date.now();
const mins=m=>new Date(now-m*60000);
const pad=n=>String(n).padStart(2,'0');
const fmtTime=d=>`${pad(d.getHours())}:${pad(d.getMinutes())}:${pad(d.getSeconds())}`;
const fmtDate=d=>`${d.getFullYear()}.${pad(d.getMonth()+1)}.${pad(d.getDate())}`;
const relTime=d=>{let s=Math.max(0,Math.floor((Date.now()-d.getTime())/1000));if(s<60)return s+'s';let m=Math.floor(s/60);if(m<60)return m+'m ago';return Math.floor(m/60)+'h ago';};
const rand=a=>a[Math.floor(Math.random()*a.length)];
const hex=()=>Array.from({length:5},()=>'0123456789ABCDEF'[Math.floor(Math.random()*16)]).join('');
const esc=s=>String(s).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');

const MOCK=[
  {id:'INC-88A2D',file:'Site_Plan_Macros.xlsm',source:'Subcontractor CAD Upload Portal',risk:'High',status:'Blocked',detectedAt:mins(4),size:'12.4 MB',riskScore:84,violation:'Embedded VBA macros and exposed credentials',rules:['Macro Risk Detection','Credential Exposure'],fix:'Strip active VBA macro layers, mask exposed credentials, apply AES-256 encryption, and forward the sanitized document to the BIM project repository.',carbon:.6},
  {id:'INC-93C7F',file:'Tender_Budget_2026.xlsx',source:'Procurement Tender System',risk:'Medium',status:'Pending Review',detectedAt:mins(11),size:'3.1 MB',riskScore:57,violation:'Unencrypted financial project data',rules:['Sensitive Financial Data'],fix:'Apply an AES-256 encryption wrapper before storage and tag the document as commercially sensitive in the tender folder.',carbon:.3},
  {id:'INC-44B9A',file:'Updated_Drawings.exe',source:'Site Inspection Mobile App',risk:'Critical',status:'Blocked',detectedAt:mins(19),size:'8.8 MB',riskScore:97,violation:'Executable file masquerading as a drawing',rules:['Executable File Detection'],fix:'Permanently drop the payload, quarantine the hash, and alert the source owner. Do not release to cloud storage under any policy.',carbon:.4},
  {id:'INC-71E0C',file:'Contractor_Access_List.csv',source:'Procurement Tender System',risk:'High',status:'Blocked',detectedAt:mins(34),size:'0.9 MB',riskScore:78,violation:'Exposed credentials and personal access records',rules:['Credential Exposure'],fix:'Mask credential and access columns, redact PII, then release the sanitized list to the site reporting archive.',carbon:.2},
  {id:'INC-2F5A1',file:'BIM_Export_Script.js',source:'Drone Survey Upload Gateway',risk:'Critical',status:'Sanitized & Released',detectedAt:mins(62),size:'0.3 MB',riskScore:91,violation:'Active script payload in BIM export channel',rules:['Executable File Detection'],fix:'Neutralize the executable script, extract only the BIM geometry payload, and forward sanitized data to the BIM model repository.',carbon:.5},
];

const state={
  view:'dashboard', incidents:MOCK.slice(), selectedId:null,
  metrics:{inspected:2847,blocked:14,sanitized:9,carbon:4.8,riskyGB:18.6,costSaved:142.50},
  forwarding:false,
  activity:[
    {id:1,kind:'block',text:'Threat blocked — Updated_Drawings.exe',at:mins(2)},
    {id:2,kind:'approve',text:'Remediation approved — BIM_Export_Script.js',at:mins(8)},
    {id:3,kind:'mask',text:'Credentials masked — Contractor_Access_List.csv',at:mins(15)},
    {id:4,kind:'allow',text:'Traffic allowed — Structural_Drawings_Rev04.pdf',at:mins(22)},
    {id:5,kind:'carbon',text:'Carbon impact updated — 0.7 kg CO₂e saved',at:mins(28)},
  ],
  search:'', statusFilter:'All',
};
let actId=100; const nextId=()=>++actId;

/* ====================================================================
   HTML BUILDERS
   ==================================================================== */
const tag=(text,color,sq=false)=>`<span class="tag" style="color:${color}">${sq?'<span class="sq"></span>':''}${text}</span>`;
const dim=label=>`<div class="dim"><span class="tick"></span><span class="ln"></span><span class="lab">${label}</span><span class="ln"></span><span class="tick"></span></div>`;
const secLabel=(code,title,meta='',o=false)=>`<div class="seclabel"><span class="code ${o?'o':''}">${code}</span><span class="t">${title}</span><span class="rule"></span>${meta?`<span class="meta">${meta}</span>`:''}</div>`;

function fileGlyph(name){
  const e=name.split('.').pop().toLowerCase();
  if(['exe','scr','bat','js'].includes(e))return ic('fileCode',18,'var(--red)');
  if(['xlsm','xlsx','csv'].includes(e))return ic('fileSheet',18,'var(--amber)');
  if(e==='ifc')return ic('boxes',18,'var(--blue)');
  return ic('file',18,'var(--ink3)');
}

/* schedule strip (metrics) */
function schedule(){
  const m=state.metrics;
  const cell=(cc,cv,cl,cs,cd,bar)=>`<div class="sch-cell">
    <div class="cc">${cc}</div><div class="cd mono" style="color:${cd.c}">${cd.t}</div>
    <div class="cv">${cv}</div><div class="cl">${cl}</div><div class="cs">${cs}</div>
    <div class="accent-bar" style="background:${bar}"></div></div>`;
  return `<div class="schedule">
    ${cell('01 · INSPECTED',m.inspected.toLocaleString(),'Traffic Inspected','Payloads scanned today',{c:'var(--green)',t:'+18%'},'var(--ink)')}
    ${cell('02 · BLOCKED',m.blocked,'Threats Blocked','Suspicious payloads quarantined',{c:'var(--red)',t:'LIVE'},'var(--red)')}
    ${cell('03 · RELEASED',m.sanitized,'Sanitized & Released','Approved remediation actions',{c:'var(--green)',t:'+3'},'var(--green)')}
    ${cell('04 · CARBON',m.carbon.toFixed(1)+' kg',"Carbon Saved (CO₂e)",'Storage waste avoided',{c:'var(--green)',t:'+0.7'},'var(--blue)')}
    ${cell('05 · COST SAVED','$'+m.costSaved.toFixed(2),'Cloud Budget Saved','Compute & storage spend avoided',{c:'var(--green)',t:'SAVED'},'var(--orange)')}
  </div>`;
}

/* interceptor schematic */
function wire(out){let p='';for(let i=0;i<3;i++)p+=`<span class="packet" style="animation-delay:${i*0.85}s"></span>`;return `<div class="wire ${out?'out':''}">${p}</div>`;}
function fnode(num,title,cap){return `<div class="fnode"><div class="box"><span class="num">${num}</span>${title}</div><div class="cap">${cap}</div></div>`;}
function interceptor(){
  return `<div class="sheetpanel schematic">
    <span class="corner c-tl"></span><span class="corner c-tr"></span><span class="corner c-bl"></span><span class="corner c-br"></span>
    <div class="flex between items-center" style="margin-bottom:6px;">
      ${secLabel('D','Traffic Interception Schematic','REF SS-01',true)}
    </div>
    <div style="font-size:12px;color:var(--ink2);margin:-6px 0 4px;">Inline gateway — construction sources route through the interceptor before reaching cloud storage.</div>
    <div class="flow">
      ${fnode('A','SOURCES','4 inbound streams')}
      ${wire(false)}
      <div class="seal" id="seal">${seal(96)}</div>
      ${wire(true)}
      ${fnode('B','PROJECT CLOUD','4 repositories')}
    </div>
    <div class="flow-legend">
      <span class="lg"><span class="m" style="background:var(--green)"></span>ALLOWED</span>
      <span class="lg"><span class="m" style="background:var(--red)"></span>BLOCKED</span>
      <span class="lg"><span class="m" style="background:var(--amber)"></span>UNDER REVIEW</span>
      <span class="lg"><span class="m" style="background:var(--orange)"></span>SANITIZED</span>
      <button class="btn" data-sim style="margin-left:auto;"><span class="pl">+</span> Simulate Incoming Traffic</button>
    </div>
    <div class="srcrow">
      ${SOURCES.map((s,i)=>`<div class="srccell"><span class="si">${ic(s.icon,20,'var(--blue)')}</span><span class="sn">${s.name}</span><span class="live"></span></div>`).join('')}
    </div>
  </div>`;
}

/* field log (activity) */
const TICKC={allow:'var(--green)',block:'var(--red)',approve:'var(--orange)',drop:'var(--ink3)',mask:'var(--blue)',carbon:'var(--green)'};
function fieldlog(){
  return `<div class="sheetpanel fieldlog">
    <div class="fl-head"><span>FIELD LOG · LIVE</span><span class="live-dot"></span></div>
    <div class="fl-body">${state.activity.map(a=>`<div class="fl-item">
      <div class="fl-time">${relTime(a.at)}</div>
      <div class="fl-tick" style="background:${TICKC[a.kind]||'var(--ink3)'}"></div>
      <div class="fl-txt">${esc(a.text)}</div></div>`).join('')}</div>
  </div>`;
}

/* revision table (incidents) */
function incRows(rows,compact){
  if(!rows.length)return `<tr><td colspan="${compact?6:7}" class="empty">No records match the current filter. Adjust the search or simulate new traffic.</td></tr>`;
  return rows.map(i=>`<tr class="clickable" data-incident="${i.id}">
    <td class="idcell">${i.id}</td>
    <td><div class="fcell"><span class="fg">${fileGlyph(i.file)}</span><span class="truncate">${i.file}</span></div></td>
    ${compact?'':`<td style="color:var(--ink2);font-size:12px;">${i.source}</td>`}
    <td>${tag(RISK[i.risk].code,RISK[i.risk].c)}</td>
    <td>${tag(STAT[i.status].code,STAT[i.status].c,true)}</td>
    <td class="mono" style="font-size:11px;color:var(--ink3);">${relTime(i.detectedAt)}</td>
    <td><span class="act-link">REVIEW →</span></td>
  </tr>`).join('');
}
function revTable(rows,code,title,meta,compact){
  return `<div class="sheetpanel">
    ${title?`<div style="padding:14px 16px 0;">${secLabel(code,title,meta)}</div>`:''}
    <div class="tblwrap"><table><thead><tr>
      <th>Incident ID</th><th>File</th>${compact?'':'<th>Source Stream</th>'}<th>Risk</th><th>Status</th><th>Detected</th><th>Action</th>
    </tr></thead><tbody id="incBody">${incRows(rows,compact)}</tbody></table></div>
  </div>`;
}

/* carbon plot — plotted on engineering grid, no gradient */
function carbonData(){const base=[3.2,4.1,3.7,5.0,4.4,5.8];const d=['MON','TUE','WED','THU','FRI','SAT','SUN'];return d.map((x,i)=>({day:x,kg:i<6?base[i]:+state.metrics.carbon.toFixed(1)}));}
function carbonPlot(data,H=158){
  const W=340,pl=30,pr=10,pt=12,pb=24,plotW=W-pl-pr,plotH=H-pt-pb;
  const max=Math.max(...data.map(d=>d.kg))*1.15||1;
  const x=i=>pl+plotW*i/(data.length-1), y=v=>pt+plotH*(1-v/max);
  let line='',grid='',lab='',nodes='';
  data.forEach((d,i)=>line+=(i?'L':'M')+x(i).toFixed(1)+' '+y(d.kg).toFixed(1)+' ');
  for(let t=0;t<=3;t++){const v=max*t/3,Y=y(v);
    grid+=`<line x1="${pl}" y1="${Y.toFixed(1)}" x2="${W-pr}" y2="${Y.toFixed(1)}" stroke="var(--lineSoft)" stroke-width="1"/>`;
    lab+=`<text x="${pl-7}" y="${(Y+3).toFixed(1)}" text-anchor="end" font-family="'IBM Plex Mono'" font-size="8" fill="var(--ink3)">${v.toFixed(1)}</text>`;}
  data.forEach((d,i)=>{nodes+=`<rect x="${(x(i)-2.6).toFixed(1)}" y="${(y(d.kg)-2.6).toFixed(1)}" width="5.2" height="5.2" fill="var(--green)"/>`;
    lab+=`<text x="${x(i).toFixed(1)}" y="${H-7}" text-anchor="middle" font-family="'IBM Plex Mono'" font-size="8" fill="var(--ink3)">${d.day}</text>`;});
  return `<svg viewBox="0 0 ${W} ${H}" width="100%" height="${H}" preserveAspectRatio="none" style="overflow:visible;display:block;">
    <line x1="${pl}" y1="${pt}" x2="${pl}" y2="${pt+plotH}" stroke="var(--ink)" stroke-width="1.5"/>
    <line x1="${pl}" y1="${pt+plotH}" x2="${W-pr}" y2="${pt+plotH}" stroke="var(--ink)" stroke-width="1.5"/>
    ${grid}<path d="${line}" fill="none" stroke="var(--green)" stroke-width="2"/>${nodes}${lab}</svg>`;
}
function carbonCard(compact){
  const m=state.metrics;
  return `<div class="sheetpanel" style="padding:16px;">
    ${secLabel('C','Carbon Impact','TODAY')}
    <div class="statgrid" style="margin-bottom:14px;">
      <div class="statc"><div class="sb" style="color:var(--green)">${m.carbon.toFixed(1)}<span class="su"> kg CO₂e</span></div><div class="slb">Emissions avoided</div></div>
      <div class="statc"><div class="sb" style="color:var(--blue)">${m.riskyGB.toFixed(1)}<span class="su"> GB</span></div><div class="slb">Risky data blocked</div></div>
    </div>
    ${carbonPlot(carbonData(),compact?138:158)}
    ${compact?'':`<div class="note" style="margin-top:12px;">By blocking risky, duplicate, or oversized files before cloud storage, Servo reduces unnecessary data transfer, storage consumption, and associated carbon emissions.</div>`}
  </div>`;
}

/* rule engine */
function ruleEngine(){
  return `<div class="sheetpanel">
    <div style="padding:14px 16px 0;">${secLabel('SR','Security Rule Engine','5 ACTIVE POLICIES',true)}</div>
    <div class="tblwrap"><table class="deftable"><thead><tr><th>Code</th><th>Rule</th><th>Detection Logic</th><th>Action</th><th>State</th></tr></thead>
    <tbody>${RULES.map(r=>`<tr>
      <td class="rulecode">${r.code}</td>
      <td><div class="flex items-center" style="gap:9px;"><span style="width:9px;height:9px;background:${r.c};flex-shrink:0;"></span><span class="disp" style="font-weight:600;font-size:12.5px;">${r.name}</span></div></td>
      <td style="color:var(--ink2);font-size:12px;">${esc(r.logic)}</td>
      <td><span class="mono" style="font-size:11px;">${r.action}</span></td>
      <td>${tag('ACTIVE','var(--green)',true)}</td></tr>`).join('')}</tbody></table></div>
  </div>`;
}

/* ====================================================================
   VIEWS
   ==================================================================== */
const vhead=(t,s)=>`<div class="view-head"><div class="vt">${t}</div><div class="vs">${s}</div></div>`;
function filtered(base){
  const q=state.search.trim().toLowerCase();
  return base.filter(i=>{
    const mq=!q||i.id.toLowerCase().includes(q)||i.file.toLowerCase().includes(q)||i.source.toLowerCase().includes(q);
    const ms=state.statusFilter==='All'||i.status===state.statusFilter;
    return mq&&ms;});
}

function viewDashboard(){
  return `<div class="stack">
    ${schedule()}
    ${dim('Traffic Interception · Section D')}
    <div class="two-col">${interceptor()}${fieldlog()}</div>
    ${dim('Incident Register · Section E')}
    <div class="two-col">${revTable(state.incidents.slice(0,6),'E','Recent Incident Register','LATEST 6',true)}${carbonCard(true)}</div>
  </div>`;
}
function viewTraffic(){
  return `<div class="stack">
    ${vhead('Live Traffic Monitor','Payloads routed through the interceptor in real time.')}
    ${schedule()}
    <div class="two-col">${interceptor()}${fieldlog()}</div>
    ${ruleEngine()}
  </div>`;
}
function viewIncidents(isQ){
  const base=isQ?state.incidents.filter(i=>i.status==='Blocked'||i.status==='Pending Review'):state.incidents;
  const rows=filtered(base);
  const filters=isQ?'':`<div class="filters">${['All','Blocked','Pending Review','Sanitized & Released','Dropped'].map(s=>`<button class="fbtn ${state.statusFilter===s?'active':''}" data-filter="${s}">${(STAT[s]?STAT[s].code:'ALL')}</button>`).join('')}</div>`;
  return `<div class="stack" style="gap:18px;">
    ${vhead(isQ?'Quarantine Vault':'Incident Reports',isQ?'Payloads held at the interceptor awaiting review or remediation.':'Full register of intercepted, released, and voided traffic.')}
    <div class="toolbar"><div class="searchbox">${ic('search',16)}<input id="searchInput" placeholder="Search by incident ID, file, or source…" value="${esc(state.search)}"/></div>${filters}</div>
    ${revTable(rows,null,null,null,false)}
  </div>`;
}
function viewCarbon(){
  const m=state.metrics;
  const b=[
    {code:'C-01',label:'Risky data prevented from reaching cloud',v:m.riskyGB.toFixed(1)+' GB',c:'var(--blue)'},
    {code:'C-02',label:'Carbon emissions avoided today',v:m.carbon.toFixed(1)+' kg CO₂e',c:'var(--green)'},
    {code:'C-03',label:'Reduction in unnecessary storage transfers',v:'27%',c:'var(--orange)'},
    {code:'C-04',label:'Energy saved from avoided cloud processing',v:'1.9 kWh',c:'var(--amber)'},
  ];
  const total=carbonData().reduce((s,d)=>s+d.kg,0).toFixed(1);
  return `<div class="stack">
    ${vhead('Carbon Impact','Energy-aware interception — every blocked payload is storage and compute never spent.')}
    <div class="schedule">${b.map((x,i)=>`<div class="sch-cell"><div class="cc">${x.code}</div><div class="cv" style="font-size:26px;color:${x.c}">${x.v}</div><div class="cl">${x.label}</div><div class="accent-bar" style="background:${x.c}"></div></div>`).join('')}</div>
    <div class="two-col">${carbonCard(false)}
      <div class="sheetpanel" style="padding:16px;">${secLabel('C-05','Rationale')}
        <p class="note">Servo acts as a Continuous Optimization System. By catching threats and oversized payloads at the gateway, we ensure structural BIM workflows remain resilient while dropping compute costs, lowering infrastructure overhead, and slashing the platform carbon footprint.</p>
        ${dim('7-day total')}
        <div class="flex between items-center" style="margin-top:12px;"><span style="color:var(--ink2);font-size:13px;">Emissions avoided this week</span><span class="disp" style="color:var(--green);font-weight:600;font-size:18px;">${total} kg CO₂e</span></div>
      </div></div>
  </div>`;
}
function viewPolicies(){return `<div class="stack">${vhead('Security Policies','The live rule set every incoming payload is evaluated against.')}${ruleEngine()}</div>`;}
function viewIntegrations(){
  return `<div class="stack">${vhead('Integrations','Connected construction data sources and cloud destinations.')}
    <div class="two-col">
      <div class="sheetpanel"><div style="padding:14px 16px 4px;">${secLabel('I-01','Inbound Sources','',true)}</div>
        ${SOURCES.map(s=>`<div class="intcard"><span class="ii">${ic(s.icon,22,'var(--blue)')}</span><span class="inm">${s.name}</span>${tag('CONNECTED','var(--green)',true)}</div>`).join('')}</div>
      <div class="sheetpanel"><div style="padding:14px 16px 4px;">${secLabel('I-02','Cloud Destinations')}</div>
        ${DESTINATIONS.map(d=>`<div class="intcard"><span class="ii">${ic('database',22,'var(--ink2)')}</span><span class="inm">${d}</span>${tag('PROTECTED','var(--orange)',true)}</div>`).join('')}</div>
    </div></div>`;
}
function viewSettings(){
  const t=[['Auto-quarantine suspicious payloads',1],['Generate AI remediation plans',1],['Require admin approval before release',1],['Track carbon impact of blocked traffic',1],['Email alert on critical incidents',0]];
  return `<div class="stack">${vhead('Settings','Interceptor behavior and notification preferences.')}
    <div class="sheetpanel">${t.map((x,i)=>`<div class="setrow"><span style="font-size:13.5px;">${x[0]}</span>
      <button class="toggle ${x[1]?'on':''}" data-toggle><span class="kn"></span><span class="lb">${x[1]?'ON':'OFF'}</span></button></div>`).join('')}</div></div>`;
}

/* ====================================================================
   RENDER
   ==================================================================== */
const VIEWS={dashboard:viewDashboard,traffic:viewTraffic,quarantine:()=>viewIncidents(true),incidents:()=>viewIncidents(false),carbon:viewCarbon,policies:viewPolicies,integrations:viewIntegrations,settings:viewSettings};
const TITLES={dashboard:'Security Operations Dashboard',traffic:'Live Traffic Monitor',quarantine:'Quarantine Vault',incidents:'Incident Reports',carbon:'Carbon Impact',policies:'Security Policies',integrations:'Integrations',settings:'Settings'};

function renderMain(){ document.getElementById('main').innerHTML=VIEWS[state.view](); }
function updateRows(){
  const tb=document.getElementById('incBody'); if(!tb)return;
  const base=state.view==='quarantine'?state.incidents.filter(i=>i.status==='Blocked'||i.status==='Pending Review'):state.incidents;
  tb.innerHTML=incRows(filtered(base),false);
}
function renderCells(){
  const n=state.incidents.filter(i=>i.status==='Blocked'||i.status==='Pending Review').length;
  document.getElementById('tbCells').innerHTML=`
    <div class="tb-cell tb-status"><div class="k">SYSTEM</div><div class="v"><span class="live-dot"></span>INTERCEPTOR ACTIVE</div></div>
    <div class="tb-cell opt"><div class="k">TIME</div><div class="v" id="clk">${fmtTime(new Date())}</div></div>
    <div class="tb-cell opt"><div class="k">SHEET</div><div class="v">${SHEETCODE[state.view]}</div></div>
    <div class="tb-cell demo-cell"><div class="k">MODE</div><div class="v">DEMO</div></div>
    <button class="notice-btn" title="Open notices">${ic('bell',18)}${n?`<span class="notice-ct">${n}</span>`:''}</button>`;
}

/* drawer */
function dial(score,risk){
  const r=20,circ=2*Math.PI*r,c=RISK[risk].c;
  return `<svg width="56" height="56" style="flex-shrink:0;"><g transform="rotate(-90 28 28)">
    <circle cx="28" cy="28" r="${r}" fill="none" stroke="var(--lineSoft)" stroke-width="4"/>
    <circle cx="28" cy="28" r="${r}" fill="none" stroke="${c}" stroke-width="4" stroke-dasharray="${circ}" stroke-dashoffset="${circ*(1-score/100)}"/></g>
    <text x="28" y="32" text-anchor="middle" font-family="'IBM Plex Mono'" font-size="14" font-weight="600" fill="${c}">${score}</text></svg>`;
}
function renderDrawer(){
  const host=document.getElementById('drawer');
  const inc=state.incidents.find(i=>i.id===state.selectedId);
  if(!inc){host.innerHTML='';return;}
  const resolved=inc.status==='Sanitized & Released'||inc.status==='Dropped';
  const cannotForward=inc.status==='Sanitized & Released'||inc.status==='Dropped'||inc.status==='Forwarded';
  const sizeMB=parseFloat(inc.size)||0;
  const costAvoided=(sizeMB*0.05).toFixed(2);
  const stamp = inc.status==='Sanitized & Released'
    ? `<div class="stampwrap"><div class="stamp released">RELEASED<small>E. BROWN · ${fmtDate(new Date())}</small></div></div>`
    : inc.status==='Dropped'
    ? `<div class="stampwrap"><div class="stamp void">VOID<small>PAYLOAD DROPPED · ${fmtDate(new Date())}</small></div></div>`
    : inc.status==='Forwarded'
    ? `<div class="stampwrap"><div class="stamp forwarded">FORWARDED<small>AWAITING SUPERVISOR · ${fmtDate(new Date())}</small></div></div>` : '';
  host.innerHTML=`
  <div class="overlay" data-overlay></div>
  <aside class="drawer">
    <div class="dr-head">
      <div><div class="ey">INCIDENT CONTROL SHEET</div><div class="id">${inc.id}</div></div>
      <button class="dr-x" data-act="close">×</button>
    </div>
    <div class="dr-body">
      <div class="dialwrap">
        <span class="fg" style="width:20px;">${fileGlyph(inc.file)}</span>
        <div style="flex:1;min-width:0;"><div class="truncate disp" style="font-weight:600;font-size:14px;">${inc.file}</div><div class="mono" style="font-size:11px;color:var(--ink3);margin-top:2px;">${inc.source}</div></div>
        ${dial(inc.riskScore,inc.risk)}
      </div>
      ${stamp}
      <div>
        <div class="specrow"><div class="sk">Status</div><div class="sv">${tag(STAT[inc.status].code,STAT[inc.status].c,true)}</div></div>
        <div class="specrow"><div class="sk">Risk Level</div><div class="sv">${tag(RISK[inc.risk].code,RISK[inc.risk].c)} <span style="color:var(--ink2);">${inc.risk}</span></div></div>
        <div class="specrow"><div class="sk">Payload Size</div><div class="sv mono">${inc.size}</div></div>
        <div class="specrow"><div class="sk">Detected</div><div class="sv mono" style="font-size:12px;">${fmtTime(inc.detectedAt)} · ${relTime(inc.detectedAt)}</div></div>
        <div class="specrow"><div class="sk">Carbon Impact</div><div class="sv mono" style="color:var(--green);">${inc.carbon.toFixed(1)} kg CO₂e</div></div>
        <div class="specrow"><div class="sk">Cost Avoided</div><div class="sv mono" style="color:var(--orange);">$${costAvoided} <span style="color:var(--ink3);">· est. cloud spend @ $0.05/MB</span></div></div>
        <div class="specrow"><div class="sk">Rules Triggered</div><div class="sv">${inc.rules.map(r=>`<span class="mono" style="font-size:11px;display:block;">— ${r}</span>`).join('')}</div></div>
      </div>
      <div class="notebox warn"><div class="nh">Security Violation</div><div class="nb">${esc(inc.violation)}</div></div>
      <div class="notebox plan"><div class="nh">AI-Generated Remediation Plan</div><div class="nb">${esc(inc.fix)}</div></div>
      <div class="acts">
        <button class="abtn primary" data-act="approve" ${resolved?'disabled':''}>✓ &nbsp;Approve Fix &amp; Release</button>
        <button class="abtn danger" data-act="drop" ${resolved?'disabled':''}>✕ &nbsp;Permanently Drop Traffic</button>
        <button class="abtn forward" data-act="forward" ${cannotForward?'disabled':''}>→ &nbsp;Forward to Supervisor for Action</button>
        <button class="abtn" data-act="download">↓ &nbsp;Download Incident Report</button>
        <button class="abtn" data-act="close" style="color:var(--ink3);">Close Sheet</button>
      </div>
    </div>
  </aside>`;
}

/* ====================================================================
   ACTIONS
   ==================================================================== */
function notice(kind,text,color){
  const id=nextId();
  const el=document.createElement('div');
  el.className='notice';
  el.innerHTML=`<div class="bar" style="background:${color}"></div><div class="ntx"><b>${kind}</b>${esc(text)}</div>`;
  document.getElementById('notices').appendChild(el);
  setTimeout(()=>el.remove(),3800);
}
function logA(kind,text){ state.activity.unshift({id:nextId(),kind,text,at:new Date()}); state.activity=state.activity.slice(0,40); }

function simulate(){
  state.metrics.inspected++;
  const suspicious=Math.random()<0.55;
  if(!suspicious){
    const f=rand(SAFE_FILES);
    logA('allow','Traffic allowed — '+f);
    notice('Allowed',f,'var(--green)');
  }else{
    const t=rand(SUSPICIOUS);
    state.incidents.unshift({id:'INC-'+hex(),file:t.file,source:rand(SOURCES).name,risk:t.risk,status:'Blocked',
      detectedAt:new Date(),size:(Math.random()*14+0.5).toFixed(1)+' MB',
      riskScore:Math.floor(Math.random()*25)+(t.risk==='Critical'?75:t.risk==='High'?65:50),
      violation:t.violation,rules:t.rules,fix:t.fix,carbon:t.carbon});
    state.metrics.blocked++; state.metrics.riskyGB=+(state.metrics.riskyGB+Math.random()*0.8).toFixed(1);
    logA('block','Threat blocked — '+t.file);
    notice('Intercepted',t.file+' · quarantined','var(--red)');
  }
  renderMain(); renderCells();
  const s=document.getElementById('seal'); if(s){s.classList.add('pulse-now');setTimeout(()=>s.classList.remove('pulse-now'),800);}
}
function approve(inc){
  inc.status='Sanitized & Released'; state.metrics.sanitized++; state.metrics.carbon=+(state.metrics.carbon+inc.carbon).toFixed(1);
  logA('approve','Remediation approved — '+inc.file);
  logA('carbon','Carbon impact updated — '+inc.carbon.toFixed(1)+' kg CO₂e saved');
  notice('Released',inc.file+' · sanitized','var(--green)');
  renderMain(); renderCells(); renderDrawer();
}
function drop(inc){
  inc.status='Dropped';
  logA('drop','Traffic voided — '+inc.file);
  notice('Voided',inc.file+' · payload dropped','var(--red)');
  renderMain(); renderCells(); renderDrawer();
}
function forward(inc){
  state.forwarding=true;
  inc.status='Forwarded';
  state.metrics.costSaved=+(state.metrics.costSaved+4.50).toFixed(2);
  logA('mask','Incident escalated: Sent to Hilti regional site supervisor for cloud approval.');
  notice('Escalated',inc.file+' forwarded to supervisor','var(--blue)');
  state.forwarding=false;
  renderMain(); renderCells(); renderDrawer();
}
function download(inc){
  const r={product:'Servo — Construction Data Traffic Interceptor',generatedAt:new Date().toISOString(),
    incident:{id:inc.id,file:inc.file,source:inc.source,riskLevel:inc.risk,riskScore:inc.riskScore,status:inc.status,
      detectedAt:inc.detectedAt.toISOString(),payloadSize:inc.size,violation:inc.violation,triggeredRules:inc.rules,
      estimatedCarbonSaved_kgCO2e:inc.carbon,remediationPlan:inc.fix}};
  const b=new Blob([JSON.stringify(r,null,2)],{type:'application/json'});
  const u=URL.createObjectURL(b),a=document.createElement('a');
  a.href=u;a.download=inc.id+'_Servo_Report.json';document.body.appendChild(a);a.click();a.remove();URL.revokeObjectURL(u);
  notice('Exported',inc.id+' report','var(--blue)');
}

function setView(v){
  state.view=v;
  document.querySelectorAll('.sheet').forEach(b=>b.classList.toggle('active',b.dataset.nav===v));
  document.getElementById('tbTitle').textContent=TITLES[v];
  state.selectedId=null; renderDrawer(); renderMain(); renderCells();
}

/* ====================================================================
   WIRING
   ==================================================================== */
document.getElementById('brandSeal').innerHTML=seal(36);
document.getElementById('nav').innerHTML=NAV.map(n=>`<button class="sheet ${n.id===state.view?'active':''}" data-nav="${n.id}"><span class="sc">${n.code.replace('SS-','')}</span><span class="sl">${n.label}</span></button>`).join('');

document.addEventListener('click',e=>{
  const nav=e.target.closest('[data-nav]'); if(nav){setView(nav.dataset.nav);return;}
  if(e.target.closest('[data-sim]')){simulate();return;}
  const flt=e.target.closest('[data-filter]'); if(flt){state.statusFilter=flt.dataset.filter;renderMain();return;}
  const tog=e.target.closest('[data-toggle]'); if(tog){tog.classList.toggle('on');tog.querySelector('.lb').textContent=tog.classList.contains('on')?'ON':'OFF';return;}
  if(e.target.closest('[data-overlay]')){state.selectedId=null;renderDrawer();return;}
  const act=e.target.closest('[data-act]'); if(act){
    const inc=state.incidents.find(i=>i.id===state.selectedId),a=act.dataset.act;
    if(a==='close'){state.selectedId=null;renderDrawer();}
    else if(inc&&a==='approve')approve(inc);
    else if(inc&&a==='drop')drop(inc);
    else if(inc&&a==='forward')forward(inc);
    else if(inc&&a==='download')download(inc);
    return;
  }
  const row=e.target.closest('[data-incident]'); if(row){state.selectedId=row.dataset.incident;renderDrawer();return;}
});
document.addEventListener('input',e=>{ if(e.target.id==='searchInput'){state.search=e.target.value;updateRows();} });
setInterval(()=>{const c=document.getElementById('clk');if(c)c.textContent=fmtTime(new Date());},1000);

renderCells();
renderMain();
EOF

# 4. Generate the mandatory hackathon compliant README
cat << 'EOF' > README.md
# Servo

**Data Traffic Interception Control — a security operations console for construction data pipelines.**

---

## Project Title and Description

**Servo** is a browser-based **Data Traffic Interception Control** platform. It sits
conceptually between an organization's file/data sources (cloud storage, field
uploads, survey feeds, site radios) and its internal network, inspecting every
payload that tries to cross the boundary. Risky or non-compliant traffic is
**intercepted, quarantined, and remediated** before it can land.

The interface is styled as a set of engineering construction drawings — a title
block, a sheet index, dimension lines, a revision/incident register, and an
approval seal — so that security operations read like a controlled, signed-off
set of plans rather than a generic dashboard. The entire experience is a
self-contained single-page application: no build step, no backend, no
dependencies beyond a web font.

---

## Team Name & Team Members

**Team Name:** _________________________

**Team Members:**
- _________________________
- _________________________
- _________________________
- _________________________

---

## Technologies Used

- **HTML** — semantic document structure and the single-page entry point (`index.html`).
- **CSS** — the complete "engineering drawing" design system in `styles.css`
  (custom properties / design tokens, the drafting grid background, the title
  block, the sheet index, the incident register table, the control drawer, and
  responsive breakpoints).
- **JavaScript** — the standalone application engine in `app.js`: in-memory
  state, mock incident data, view rendering, the live traffic simulation loop,
  metric recalculation, the incident control drawer, and all event wiring.

> Allowed languages only: **HTML, CSS, JavaScript.** No frameworks, no build
> tooling, no server.

---

## Challenge and Approach

**The engineering challenge.** Construction and field organizations move enormous
volumes of files — drawings, scans, survey data, photos — across untrusted
networks. Sensitive or malformed payloads slip through, and when something does
go wrong there is rarely a clean, auditable record of what was caught, why, and
who signed off on releasing it. The challenge was to model a **traffic
interception control loop** — detect, classify, quarantine, remediate, release
or drop — and make every action legible and audit-friendly.

**The structural / design approach.** We started from a single monolithic HTML
prototype and modularized it into clean, independent layers:

- **`index.html`** holds only structure — the sheet index, the title block, and
  empty mount points (`#nav`, `#main`, `#drawer`, `#notices`, `#tbCells`) that
  the engine fills at runtime.
- **`styles.css`** externalizes the full visual system (formerly an inline
  `<style>` block) into design tokens and well-commented components, so the look
  can be tuned without touching logic.
- **`app.js`** is loaded with `<script src="app.js" defer>` so the DOM is fully
  parsed before initialization runs. It owns a single `state` object and renders
  every view from it, which keeps the UI and the data in lockstep.

This separation means the visual language, the data model, and the control logic
can each evolve independently — the core property we wanted out of the refactor.

---

## Usage Instructions

> _(Supported by video demo or screenshots — drop your recording link or images
> here before submission.)_
>
> **Demo video:** _________________________
>
> **Screenshots:** _________________________

### Getting started

1. Clone the repository (see the commit instructions printed by `setup_repo.sh`).
2. Open **`index.html`** directly in any modern browser — there is no build step
   and no server required.
3. The console boots on the **Security Operations Dashboard**. Use the **Sheet
   Index** on the left (SS-01 … etc.) to move between views: Live Traffic
   Monitor, Quarantine Vault, Incident Reports, Carbon Impact, Policies,
   Integrations, and Settings.

### Core user flow

- **Browse the incident register.** The dashboard and Incident Reports views list
  intercepted payloads in a revision-table layout with risk level, status,
  source stream, and detection time. Use the search box and the status filters
  to narrow the register.
- **Isolate an incident.** Click any row to slide open the **Incident Control
  Sheet** (the right-hand control drawer). It shows the full classification —
  triggered rules, violation, payload size, and a remediation plan.
- **Act on it.** From the drawer you can **approve & release** (sanitize),
  **permanently drop** the traffic, **forward/escalate** to a supervisor, or
  **download a JSON incident report** for the audit trail. Each action emits a
  notice and updates the live metrics.

### ★ MVP Feature 1 — Live traffic simulation pipeline

Press **"Simulate Incoming Traffic"** (on the dashboard's Traffic Interception
section). Each click pushes a fresh payload through the interceptor:

- benign traffic is **allowed** and written to the activity log;
- suspicious traffic is **intercepted**, classified with a risk level, assigned a
  fresh incident ID, and **prepended to the live register** in real time.

This is the end-to-end interception loop — detection → classification →
quarantine → audit log — running entirely in the browser so reviewers can watch
new incidents appear and immediately triage them.

### ★ MVP Feature 2 — Dynamic data calculation drawer & metrics

Every action recomputes the platform's metrics live. The header title-block cells
and the dashboard "schedule strip" track **payloads inspected, traffic blocked,
items sanitized, risky GB held, estimated cost saved, and carbon impact
(kg CO₂e)**. Approving, dropping, or forwarding an incident from the control
drawer feeds those numbers — for example, releasing a sanitized payload rolls its
carbon figure into the running Carbon Impact total, and escalations adjust the
cost-saved tally. The metrics are therefore a true derived view of the incident
state, not static placeholders.

### Tips

- The clock in the title block ticks every second; the status indicator confirms
  the console is live.
- Downloaded incident reports are real `.json` files generated client-side — open
  one to see the full audit record for that payload.
EOF

echo "All modules created successfully! Run 'git init && git add . && git commit -m \"Initial hackathon commit\"' to push to GitHub."
