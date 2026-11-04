local yabai = "/opt/homebrew/bin/yabai"
local compass = { left = "west", right = "east", up = "north", down = "south" }

local function panes(node, out)
  if node.block_id then out[#out + 1] = node end
  if node.split then
    panes(node.split.before, out)
    panes(node.split.after, out)
  end
  return out
end

local function has_pane(direction)
  local view = rex.session.view{}
  if not view then return false end
  for _, win in ipairs(view.windows or {}) do
    if win.window_id == view.active_window_id then
      for _, layer in ipairs(win.layers or {}) do
        if layer.kind == "tiled" and layer.layout then
          local all = panes(layer.layout, {})
          local cur
          for _, p in ipairs(all) do
            if p.block_id == win.focused_block_id then cur = p.rect end
          end
          if cur then
            local e = 1e-6
            local cx, cy, cw, ch = cur[1], cur[2], cur[3], cur[4]
            for _, p in ipairs(all) do
              local x, y, w, h = p.rect[1], p.rect[2], p.rect[3], p.rect[4]
              local rows = y < cy + ch - e and y + h > cy + e
              local cols = x < cx + cw - e and x + w > cx + e
              if (direction == "left" and rows and x + w <= cx + e)
                or (direction == "right" and rows and x >= cx + cw - e)
                or (direction == "up" and cols and y + h <= cy + e)
                or (direction == "down" and cols and y >= cy + ch - e) then
                return true
              end
            end
            return false
          end
        end
      end
    end
  end
  return false
end

rex.action{
  name = "nav_focus",
  title = "Focus Pane or Window",
  args = { direction = "string" },
  run = function(ctx, args)
    if has_pane(args.direction) then
      rex.client.queue("pane.focus", { direction = args.direction, wrap = false })
    else
      rex.exec{ yabai, "-m", "window", "--focus", compass[args.direction] }
    end
  end,
}

rex.action{
  name = "nav_move",
  title = "Move Pane or Swap Window",
  args = { direction = "string" },
  run = function(ctx, args)
    if has_pane(args.direction) then
      rex.client.queue("pane.move", { direction = args.direction })
    else
      rex.exec{ yabai, "-m", "window", "--swap", compass[args.direction] }
    end
  end,
}

for key, direction in pairs({ h = "left", j = "down", k = "up", l = "right" }) do
  rex.bind("cmd+" .. key, "nav_focus", { direction = direction })
  rex.bind("shift+cmd+" .. key, "nav_move", { direction = direction })
end

rex.bind("ctrl+cmd+[", "client.tab.move", { direction = "backward" })
rex.bind("ctrl+cmd+]", "client.tab.move", { direction = "forward" })
rex.bind("ctrl+cmd+r", "client.tab.rename")
rex.bind("cmd+p", "session.switch")
