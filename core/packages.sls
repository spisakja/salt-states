install_default_packages:
  pkg:
    - installed
    - names:
      {% for pkg in pillar.get('pkgs', {}) %}
      - {{ pkg }}
      {% endfor %}

