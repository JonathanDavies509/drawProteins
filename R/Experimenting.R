BiocManager::install("BiocStyle")

drawProteins::get_features("P9WGI3") ->
  sig_json

drawProteins::feature_to_dataframe(sig_json) -> sig_data

# show in console
head(sig_data[1:4])

## creating the basic diagram
draw_canvas(sig_data) -> p
draw_chains(p,sig_data) -> p
draw_domains(p,sig_data) -> p
p

## tidying it
p <- p + theme_bw(base_size = 20) +
  theme(panel.grid.minor=element_blank(),
        panel.grid.major=element_blank()) +
  theme(axis.ticks=element_blank(),
        axis.text.y=element_blank()) +
  theme(panel.border=element_blank())
p

## experimenting adding new aspects
draw_regions(p, sig_data)
draw_repeat(p, sig_data)
draw_motif(p, sig_data)
draw_phospho(p, sig_data)

## putting it together
draw_canvas(sig_data) -> p
draw_chains(p,sig_data) -> p
draw_domains(p,sig_data) -> p
draw_regions(p, sig_data) -> p
draw_motif(p, sig_data) -> p

p <- p + theme_bw(base_size = 20) +
  theme(panel.grid.minor=element_blank(),
        panel.grid.major=element_blank()) +
  theme(axis.ticks=element_blank(),
        axis.text.y=element_blank()) +
  theme(panel.border=element_blank()) +
  theme(legend.position = "bottom")
p


## Adding titles
sig_subtitle <- paste0('Mycobacterium tuberculosis',"\nsource:Uniprot")
## havent figured out how to get italics yet

p <- p + labs(title = "SigF", subtitle = sig_subtitle)
p

## mulitple proteins M.tuberculosis sigma factors
prot_data <- drawProteins::get_features("P9WGI3 P9WGG7 P9WGH9 P9WGI1")

prot_data <- drawProteins::feature_to_dataframe(prot_data)

draw_canvas(prot_data) -> p
draw_chains(p,prot_data) -> p
draw_domains(p,prot_data) -> p
draw_regions(p, prot_data) -> p
draw_motif(p, prot_data) -> p

p <- p + theme_bw(base_size = 20) +
  theme(panel.grid.minor=element_blank(),
        panel.grid.major=element_blank()) +
  theme(axis.ticks=element_blank(),
        axis.text.y=element_blank()) +
  theme(panel.border=element_blank()) +
  theme(legend.position = "bottom")
p

prot_subtitle <- paste0("source:Uniprot")

p <- p + labs(title = "Schematic of Mycobacterium tuberculosis Sigma factors")
p

p <- p + labs(fill="")
p


##----Extra_parameters-------------------------------------------------------------
## label_chains = FALSE
## fill = "colour"
## outline = "colour"
## label_size = 5
## labels = c("this","that","etc")





