import http from 'node:http';
import fs from 'node:fs';
import path from 'node:path';
const root=process.cwd();
const types={'.html':'text/html; charset=utf-8','.js':'text/javascript; charset=utf-8','.css':'text/css; charset=utf-8','.ttf':'font/ttf','.png':'image/png','.md':'text/plain; charset=utf-8'};
http.createServer((req,res)=>{
  const pathname=decodeURIComponent(new URL(req.url,'http://localhost').pathname);
  const file=path.resolve(root,'.'+(pathname==='/'?'/index.html':pathname));
  if(!file.startsWith(root+path.sep)) { res.writeHead(403).end(); return; }
  fs.readFile(file,(error,data)=>{
    if(error) {res.writeHead(404).end('Not found');return;}
    res.writeHead(200,{'Content-Type':types[path.extname(file)] || 'application/octet-stream'});res.end(data);
  });
}).listen(5173,'127.0.0.1',()=>console.log('Hamster: http://localhost:5173'));
