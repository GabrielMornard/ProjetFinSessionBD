using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using ProjetFinSessionBD.Models;

namespace ProjetFinSessionBD.Data
{
    public partial class Formule1Context : DbContext
    {
        public Formule1Context()
        {
        }

        public Formule1Context(DbContextOptions<Formule1Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Changelog> Changelogs { get; set; } = null!;
        public virtual DbSet<Circuit> Circuits { get; set; } = null!;
        public virtual DbSet<Ecurie> Ecuries { get; set; } = null!;
        public virtual DbSet<Evenement> Evenements { get; set; } = null!;
        public virtual DbSet<EvenementSpecial> EvenementSpecials { get; set; } = null!;
        public virtual DbSet<GrandPrix> GrandPrixes { get; set; } = null!;
        public virtual DbSet<Participation> Participations { get; set; } = null!;
        public virtual DbSet<Pilote> Pilotes { get; set; } = null!;
        public virtual DbSet<Sponsor> Sponsors { get; set; } = null!;
        public virtual DbSet<Transaction> Transactions { get; set; } = null!;
        public virtual DbSet<TransactionsSimplifie> TransactionsSimplifies { get; set; } = null!;
        public virtual DbSet<VwGagnatDevenement> VwGagnatDevenements { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=Formule1");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Changelog>(entity =>
            {
                entity.Property(e => e.InstalledOn).HasDefaultValueSql("(getdate())");
            });

            modelBuilder.Entity<Ecurie>(entity =>
            {
                entity.HasOne(d => d.Sponsor)
                    .WithMany(p => p.Ecuries)
                    .HasForeignKey(d => d.SponsorId)
                    .HasConstraintName("FK_Participations_SponsorID");
            });

            modelBuilder.Entity<Evenement>(entity =>
            {
                entity.HasOne(d => d.Circuit)
                    .WithMany(p => p.Evenements)
                    .HasForeignKey(d => d.CircuitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Evenements_CircuitID");

                entity.HasOne(d => d.EvenSpecial)
                    .WithMany(p => p.Evenements)
                    .HasForeignKey(d => d.EvenSpecialId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Evenements_EvenSpecialID");
            });

            modelBuilder.Entity<EvenementSpecial>(entity =>
            {
                entity.HasKey(e => e.EvenSpecialId)
                    .HasName("PK_Evenement_EvenementSpecial");
            });

            modelBuilder.Entity<Participation>(entity =>
            {
                entity.HasOne(d => d.Ecurie)
                    .WithMany(p => p.Participations)
                    .HasForeignKey(d => d.EcurieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Participations_EcuriID");

                entity.HasOne(d => d.Evenement)
                    .WithMany(p => p.Participations)
                    .HasForeignKey(d => d.EvenementId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Participations_EvenementID");

                entity.HasOne(d => d.Pilote)
                    .WithMany(p => p.Participations)
                    .HasForeignKey(d => d.PiloteId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Participations_PiloteID");
            });

            modelBuilder.Entity<Pilote>(entity =>
            {
                entity.HasOne(d => d.Ecurie)
                    .WithMany(p => p.Pilotes)
                    .HasForeignKey(d => d.EcurieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Participations_EcurieID");
            });

            modelBuilder.Entity<Transaction>(entity =>
            {
                entity.HasOne(d => d.Ecurie)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.EcurieId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Participations_Transactions_EcurieID");

                entity.HasOne(d => d.Pilote)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.PiloteId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Participations_Transactions_PiloteId");
            });

            modelBuilder.Entity<TransactionsSimplifie>(entity =>
            {
                entity.HasKey(e => e.TransactionId)
                    .HasName("PK_Participations_TransactionsSimplifie");

                entity.Property(e => e.TransactionId).ValueGeneratedNever();

                entity.Property(e => e.Montant).IsFixedLength();
            });

            modelBuilder.Entity<VwGagnatDevenement>(entity =>
            {
                entity.ToView("vw_GagnatDevenement", "Participations");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
