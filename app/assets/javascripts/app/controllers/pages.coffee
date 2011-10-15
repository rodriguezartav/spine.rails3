$ = jQuery

class PagesEdit extends Spine.Controller
  events:
    "click .back": "back"
    "submit form": "update"

  constructor: ->
    super
    @active (params) ->
      @change Page.find(params.id)

  render: =>
    @el.html $.tmpl("app/views/pages/edit", @item)

  change: (item) ->
    @item = item
    @render()

  update: (e) ->
    e.preventDefault()
    @item.updateAttributes($(e.target).serializeForm())
    @back()
   
  back: ->
    @navigate '/pages'
    
class PagesList extends Spine.Controller

  className: "list"
  
  elements: 
    ".items": "items"
  
  events:
    "click .item": "show"
    "click .create": "create"
    "click span.button" : "destroy"
    
  constructor: ->
    super
    @el.html $.tmpl("app/views/pages/list")
    @refreshElements()
    Page.bind("refresh change", @render)
    
  render: =>
    items = Page.all()
    @items.html $.tmpl("app/views/pages/item", items)
    
  show: (e) ->
    if e
      @item = $(e.target).item()
      @navigate '/pages', @item.id, 'edit'
    
  create: (e) ->
    item = Page.create(name: 'Dummy page',count: Page.last()?.count + 1 || 1)
    @navigate "/pages", item.id, "edit"

  destroy: (e) ->
   e.stopImmediatePropagation()
   item = $(e.target).item()
   item.destroy()
   @render()

class Pages extends Spine.Controller
  elements:
    "#list" : "list_view"
    "#edit" : "edit_view"

  constructor: ->    
    super
    @list = new PagesList(el: @list_view)
    @edit = new PagesEdit(el: @edit_view)
    
    @append(@list, @edit)
    
    @routes
      "/pages": (params) => 
        @el.removeClass('show_edit')

      "/pages/:id/edit": (params) =>
        @edit.active(params)
        @el.addClass('show_edit')
   
    
    # Only setup routes once pages have loaded
    Page.bind 'refresh', -> 
      Spine.Route.setup()

    Page.fetch()
  
window.Pages = Pages