<script>
  export let pinnedItems
</script>

<div id="pinnedItems" class="container">
  <div class="columns">
    <div class="column col-3 col-lg-2 col-md-1"></div>
    <div class="column col-6 col-lg-8 col-md-10">
      <div class="container">
        <div class="columns">
          {#each pinnedItems as repo}
          <div class="column col-6 col-xs-12 pinnedItem">
            <img class="text-primary" src={repo.openGraphImageUrl} alt="repo picture" />
            <h1 class="text-primary"><a href="/">{repo.name}</a></h1>
            <p>{repo.description} <a href={repo.url}>More...</a></p>
          </div>
          {/each}
        </div>
      </div>
    </div>
    <div class="column col-3 col-lg-2 col-md-1"></div>
  </div>
</div>

<style>
.pinnedItem {
  padding: 0 1em;
}

.pinnedItem h1 {
  font-size: 1em;
}

.pinnedItem p {
  font-size: 0.9em;
}

img {
  width: 100%;
  height: 10em;
  border: 1px solid;
  border-radius: 1em;
  margin-bottom: 0.5em;
}
</style>
