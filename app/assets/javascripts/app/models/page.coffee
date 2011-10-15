class Page extends Spine.Model
  @configure "Page", "name", "slug", "body" , "count"
  @extend Spine.Model.Ajax

window.Page = Page