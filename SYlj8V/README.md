# Pagy

|本期版本|上期版本 
|:---:|:---:
`Fri Jun 24 14:47:06 CST 2022` | 

> `controller`

```ruby
include Pagy::Backend
helper_method :pagy_metadata
Pagy::DEFAULT[:items] = 4
Pagy::DEFAULT[:metadata] = [:count, :page, :items, :prev, :next, :last]
```

```
 @pagy, @posts = pagy Micropost.includes(:account), page: params[:page]
```

> `jbuilder`

```ruby
json.meta pagy_metadata(@pagy)
```


## Ref

* <https://ddnexus.github.io/pagy/docs/how-to/>