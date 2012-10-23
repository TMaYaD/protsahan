class Protsahan.Models.PicasaImage extends Backbone.Model
  paramRoot: 'picasa_image'

  defaults:
    title: null
    thumbnail: null
    url: null
  parse: (response)=>
    attributes =
      id: response.gphoto$id.$t
      title: response.summary.$t || response.title.$t
      thumbnail: response.media$group.media$thumbnail[0].url
      url: response.content.src


class Protsahan.Collections.PicasaImagesCollection extends Backbone.Collection
  model: Protsahan.Models.PicasaImage
  initialize: (models, options)=>
    @user = options.user
    @album = options.album
  url: =>
    base_url = "https://picasaweb.google.com/data/feed/api/user/#{@user}/album/#{@album}"
    params =
      kind:           'photo'
      access:         'public'
      'max-results':  30
      'start-index':  1
      thumbsize:      '160c'
      imgmax:         'd'
      alt:            'json-in-script'
    "#{base_url}?#{$.param params}&callback=?"

  parse: (response)=>
    response.feed.entry
