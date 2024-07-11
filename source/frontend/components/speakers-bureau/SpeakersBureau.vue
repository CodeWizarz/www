<script>
export default {
  components: {},
  data: function() {
    return {
      isLoading: true,
      speakers: [],
      affiliations: ['teammember', 'heroes', 'community'],
      selectedTopic: '',
      selectedRegion: '',
      selectedAffiliation: '',
      revealCard: '',
    };
  },
  computed: {
    options: function() {
      return 'foo';
    },
    filteredspeakers: function() {
      let filtered = this.speakers.filter((s) => s.status != 'pending').sort((a, b) => (a.name > b.name) ? 1 : -1);
      if (this.selectedTopic.length > 0)
        filtered = filtered.filter((s) =>
          s.topics?.includes(this.selectedTopic)
        );
      if (this.selectedRegion.length > 0)
        filtered = filtered.filter((s) =>
          s.region?.includes(this.selectedRegion)
        );
      if (this.selectedAffiliation.length > 0)
        filtered = filtered.filter((s) =>
          s.affiliation?.includes(this.selectedAffiliation)
        );
      return filtered;
    },
    regions: function() {
      return [...new Set(this.speakers.map((s) => s.region))]
        .filter((e) => e != null)
        .sort();
    },
    topics: function() {
      const allt = this.speakers.map((s) => {
        if (s.topics) return s.topics;
      });
      return [...new Set(allt.flat())].filter((e) => e != null).sort();
    },
  },
  mounted: function() {
    this.getSourceData();
  },
  methods: {
    getSourceData: function() {
      // eslint-disable-next-line promise/catch-or-return
      fetch('/speakers/data.json')
        .then((response) => response.json())
        .then(this.setData);
    },
    setData: function(data) {
      const vue = this;

      vue.speakers = data;
      this.isLoading = false;
    },
    getImg(s) {
      if (s.image) return `/images/speakers/${s.image}`;
      return '/images/default-blog-image.png';
    },
    getAffiliation(a) {
      switch (a) {
        case 'teammember':
          return 'GitLab Team Member';
        case 'heroes':
          return 'GitLab Hero';
        case 'community':
          return 'Wider Community Member';
        default:
          return 'GitLab Team Member';
      }
    }
  },
};
</script>

<template>
  <div>
    <h2>🗣️ Our Speakers</h2>
    <p>
      Organizing an event? Looking for a speaker from GitLab? Here's a list of
      awesome speakers from the GitLab team and wider community. <a href='https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/new?issuable_template=speaker-request'>Create a GitLab issue</a> to request a speaker.
    </p>

    <div v-show="isLoading" class="loading-speakers">
      Loading speakers...
    </div>

    <div v-show="!isLoading">
    <div class="selects">
      <div class="filter-item select">
        <label for="topic-select">
          📓 Topic
          <span v-if="selectedTopic != ''" @click="selectedTopic = ''"
            >Show all</span
          >
        </label>
        <select id="topic-select" v-model="selectedTopic" class="filterSelect">
          <option value selected>All Topics</option>
          <option v-for="(t, i) in topics" :key="i" :value="t">{{ t }}</option>
        </select>
      </div>
      <div class="filter-item select">
        <label for="region-select">
          🗺️ Region
          <span v-if="selectedRegion != ''" @click="selectedRegion = ''"
            >Show all</span
          >
        </label>
        <select
          id="region-select"
          v-model="selectedRegion"
          class="filterSelect"
        >
          <option value selected>All Regions</option>
          <option v-for="(r, i) in regions" :key="i" :value="r">{{ r }}</option>
        </select>
      </div>
      <div class="filter-item select">
        <label for="affiliation-select">
          🦊 Affiliation
          <span v-if="selectedAffiliation != ''" @click="Affiliation = ''"
            >Show all</span
          >
        </label>
        <select
          id="affiliation-select"
          v-model="selectedAffiliation"
          class="filterSelect"
        >
          <option value selected>All Affiliations</option>
          <option v-for="(r, i) in affiliations" :key="i" :value="r">{{ getAffiliation(r) }}</option>
        </select>
      </div>
    </div>

    <section class="speaker-card-list">
      <article v-for="(s, i) in filteredspeakers" :key="i" class="speaker-card" transition="fade">
        <div v-show="revealCard != s.gitlab" :id="`card-${s.gitlab}-front`" transition="fade" class="speaker-card-side">
          <div class="speaker-img-container">
            <img :class="{ 'speaker-img': s.image }" :src="getImg(s)" height="201" />
          </div>
          <header class="speaker-card-header">
            <div class="speaker-card-speaker">
              <p>{{ s.location }}</p>
              <h2>
                <a @click="revealCard = s.gitlab">{{ s.name }}</a>
              </h2>
            </div>
            <div class="speaker-card-icon">
              <img :src="`/images/logo_${s.affiliation ? s.affiliation : 'teammember'}.png`" />
            </div>
          </header>

          <p class="speaker-card-text">
            {{ s.tagline }}
          </p>
          <div class="speaker-social">
            <div>
              <a v-if="s.gitlab" :href="`https://gitlab.com/${s.gitlab}`" target="_blank">
                <img src="/images/speaker_gitlab_logo.png" width="29" />
              </a>
            </div>
            <div>
              <a v-if="s.twitter" :href="`https://twitter.com/${s.twitter}`" target="_blank">
                <img src="/images/speaker_twitter_logo.png" width="29" />
              </a>
            </div>
            <div class="speaker-learn-more" @click="revealCard = `${s.gitlab}`">
              Learn More →
            </div>
          </div>
        </div>
        <div v-show="revealCard === s.gitlab" :id="`card-${s.gitlab}-back`" transition="fade" class="speaker-card-side">
          <header class="speaker-card-header" style="margin-top: 1rem;">
            <div class="speaker-card-speaker">
              <p>
                {{ getAffiliation(s.affiliation) }}
              </p>
              <h2>
                <a>{{ s.name }}</a>
              </h2>
            </div>
            <div class="speaker-card-icon" @click="revealCard = ''">
              <i class="fas fa-close fa-fw"></i>
            </div>
          </header>

          <div v-if="s.presentations" class="speaker-card-presentations">
            <p>Previous presentations:</p>
            <ul>
              <li v-for="(item, index) in s.presentations" :key="index">
                <a :href="item.link" target="_blank">
                  {{item.title}}
                </a>
              </li>
            </ul>
          </div>
          <div v-else class="speaker-card-presentations">
            <p>No previous presentations.</p>
          </div>
        </div>
      </article>
    </section>
    </div>
  </div>
</template>

<style scoped>
.filterSelect {
  padding: 2px 4px;
}

.loading-speakers {
  text-align: center;
  font-size: 89%;
  font-weight: 300;
}

/* Select Styles */
.selects {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
}

.filter-item {
  margin: 1rem;
}

.select label {
  font-size: 20px;
  margin: 0 0 0.5rem;
  color: #7a7a8c;
}

.select label span {
  font-size: 14px;
  color: #fa7035;
  float: right;
  cursor: pointer;
}

select {
  position: relative;
  display: flex;
  width: 20em;
  height: 3em;
  line-height: 3;
  background: #fa7035c4;
  overflow: hidden;
  border-radius: 0.25em;
  flex: 1;
  padding: 0 0.5em;
  color: #fff;
  cursor: pointer;
}

.select:hover select {
  background: #fa7035;
}

/* Speaker Card */

.speaker-card-list {
  padding: 1.5rem;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: center;
}

.speaker-card-side {
  height: 100%;
  width: 344px;
}

.speaker-card {
  height: 455px;
  width: 344px;
  min-width: 250px;
  padding: 0rem;
  border-radius: 6px;
  /* background: #17141d; */
  box-shadow: 0 0.5em 1em -0.125em rgba(10, 10, 10, 0.1),
    0 0 0 1px rgba(10, 10, 10, 0.02);
  display: flex;
  flex-direction: column;
  transition: 0.2s;
  margin: 2rem 0.7rem;
  border-top: medium solid #FC6D26;
  /* scroll-snap-align: start;
  clear: both;
  position: relative; */
}

.speaker-card:hover {
  box-shadow: 0 0.5em 1em -0.125em rgba(10, 10, 10, 0.55),
    0 0 0 1px rgba(10, 10, 10, 0.1);
}

.speaker-card-header {
  margin: 0.5rem 0.5rem 0 0.5rem;
  display: grid;
  grid-template-columns: 1fr 55px;
  align-items: center;
  position: relative;
  height: 97px;
  overflow: hidden;
}

.speaker-card-icon {
  margin-right: .55rem;
}

.speaker-img {
  filter: grayscale(100%);
}

.speaker-img-container {
  width: 100%;
  margin-left: auto;
  margin-right: auto;
  display: flex;
  justify-content: center;
}

.speaker-card-speaker {
  margin-left: 1.5rem;
}

.speaker-card-speaker p {
  font-size: 14px;
  margin: 0 0 0.5rem;
  color: #7a7a8c;
}

.speaker-card-speaker h2 {
  font-size: 20px;
  margin: 0.2rem 0 auto;
  color: inherit;
  border: 0;
  display: inline-block;
  cursor: pointer;
  overflow: hidden;
}

.speaker-card-speaker h2 a {
  text-decoration: none !important;
  /* color: #333 !important; */
}

.speaker-card-text {
  margin: 0 1.5rem 0.5rem 1.5rem;
  min-height: 81px;
}

.speaker-social {
  display: grid;
  margin: 1.5rem;
  grid-template-columns: 40px 40px 1fr;
}

.speaker-learn-more {
  text-align: right;
  margin-right: 1rem;
  color: #5544887c;
  font-size: 88%;
  cursor: pointer;
}

.card-flip-transition {
  transition: all .3s ease;
  height: 30px;
  padding: 10px;
  background-color: #eee;
  overflow: hidden;
}

.card-flip-enter, .card-flip-leave {
  height: 0;
  padding: 0 10px;
  opacity: 0;
}

.speaker-card-presentations {
  margin: 1rem 2rem;
}

.fade-transition {
  transition: all 1.3s ease;
}
</style>
