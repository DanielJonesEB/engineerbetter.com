# EngineerBetter Web Site

Delivery pipeline is [here](https://ci.engineerbetter.com/pipelines/engineerbetter-com)

## Usage

```
git clone https://github.com/EngineerBetter/engineerbetter.com/

bundle install

jekyll serve
```

## Testing

```
$ jekyll serve --detach
$ SPEC_APP_HOST=localhost:4000 bundle exec rspec
$ pkill -f jekyll
```