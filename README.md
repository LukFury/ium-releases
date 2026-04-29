  IUM — by COPE                                                                                                                                                                           
                                                                                                                                                                                          
  Give your AI a map of your codebase.                                                                                                                                                    
                                                                                                                                                                                          
  AI coding assistants are powerful — but they navigate your code blind. They grep, they guess, they read files they don't need. IUM fixes that. It builds a precise symbol index of your 
  entire codebase so your AI can find exactly what it needs, instantly, without reading thousands of files.                                                                               
                                                                                                                                                                                          
  ---                                                                                                                                                                                     
  What it does
                                                                                                                                                                                          
  IUM indexes your codebase and exposes it as tools your AI can call:
                                                                                                                                                                                          
  - Find any symbol — where it's defined, called, mutated, or referenced. Exact file and line, every time.                                                                                
  - Search by concept — ask "license validation" and get ranked results. No exact name needed.                                                                                            
  - Trace call graphs — walk callers and callees to any depth in milliseconds.                                                                                                            
  - Show source — pull up the definition of any function without opening a file.                                                                                                          
  - Stay current — watches your project for changes and updates the index automatically.                                                                                                  
                                                                                                                                                                                          
  Everything runs locally. Your code never leaves your machine.                                                                                                                           
                                                                                                                                                                                          
  ---                                                                                                                                                                                     
  Why it works         
              
  Most "AI code tools" dump files into context and hope. IUM is built specifically for how AI navigates code — precise coordinates, not approximate chunks.
                                                                                                                                                                                          
  Real-world benchmark against DataFusion (1,538 files): 93.7% fewer tokens vs grep for equivalent queries.                                                                               
                                                                                                                                                                                          
  ---                                                                                                                                                                                     
  Works with           
            
  Any MCP-compatible AI assistant — Claude Code, Cursor, Cline, Windsurf, and more.
                                                                                                                                                                                          
  ---
  Supported languages                                                                                                                                                                     
                       
  Rust, Python, TypeScript, CSS, SCSS, HTML — more added regularly.
                                                                                                                                                                                          
  ---
  Install                                                                                                                                                                                 
                                                                                                                                                                                          
  curl -fsSL https://raw.githubusercontent.com/LukFury/ium-releases/master/install.sh | sh
                                                                                                                                                                                          
  Then in your project:                                                                                                                                                                   
   
  ium scan .    # index your codebase                                                                                                                                                     
  ium embed     # build semantic search (one-time, ~130MB model download)

  ---
  Connect to your AI
                                                                                                                                                                                          
  IUM runs as an MCP server. You register it once — your AI tool starts it automatically from then on.
                                                                                                                                                                                          
  Claude Code (global — works in every project):                                                                                                                                          
  claude mcp add ium $(which ium) mcp --scope user                                                                                                                                        
                                                                                                                                                                                          
  Claude Code (per-project — add to .claude/settings.json in your repo):
  {                                                                                                                                                                                       
    "mcpServers": {
      "ium": {                                                                                                                                                                            
        "command": "/home/you/.local/bin/ium",
        "args": ["mcp"]                       
      }                                                                                                                                                                                   
    }  
  }                                                                                                                                                                                       
                       
  Cursor, Cline, Windsurf, and other MCP-compatible tools:
                                                                                                                                                                                          
  Add this to your tool's MCP config file (e.g. .cursor/mcp.json):                                                                                                                        
  {                                                                                                                                                                                       
    "mcpServers": {                                                                                                                                                                       
      "ium": {         
        "command": "/home/you/.local/bin/ium",
        "args": ["mcp"]                       
      }                                                                                                                                                                                   
    }  
  }                                                                                                                                                                                       
                       
  Replace /home/you/.local/bin/ium with the path from which ium.
                                                                                                                                                                                          
  ---
  Pricing                                                                                                                                                                                 
                       
  Founder tier — $10/mo forever (limited slots) → Get founder license
                                                                                                                                                                                          
  Standard — $15/mo → Get license                                                                                                                                                         
                                                                                                                                                                                          
  ---                                                                                                                                                                                     
  Questions            
           
  support@copecode.dev
                                                                                                                                                                                          
  by COPE — copecode.dev 
