<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200420200036 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE category (id INT AUTO_INCREMENT NOT NULL, item_bundle_id INT NOT NULL, name VARCHAR(50) NOT NULL, parent_id INT DEFAULT NULL, UNIQUE INDEX UNIQ_64C19C1FD20CF23 (item_bundle_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET UTF8 COLLATE `UTF8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE form_input (id INT AUTO_INCREMENT NOT NULL, item_id INT NOT NULL, name VARCHAR(255) NOT NULL, terms_agreed TINYINT(1) NOT NULL, INDEX IDX_5B6F9614126F525E (item_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET UTF8 COLLATE `UTF8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE item (id INT AUTO_INCREMENT NOT NULL, item_bundle_id INT NOT NULL, name VARCHAR(50) NOT NULL, INDEX IDX_1F1B251EFD20CF23 (item_bundle_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET UTF8 COLLATE `UTF8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE item_bundle (id INT AUTO_INCREMENT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET UTF8 COLLATE `UTF8_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE category ADD CONSTRAINT FK_64C19C1FD20CF23 FOREIGN KEY (item_bundle_id) REFERENCES item_bundle (id)');
        $this->addSql('ALTER TABLE form_input ADD CONSTRAINT FK_5B6F9614126F525E FOREIGN KEY (item_id) REFERENCES item (id)');
        $this->addSql('ALTER TABLE item ADD CONSTRAINT FK_1F1B251EFD20CF23 FOREIGN KEY (item_bundle_id) REFERENCES item_bundle (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE form_input DROP FOREIGN KEY FK_5B6F9614126F525E');
        $this->addSql('ALTER TABLE category DROP FOREIGN KEY FK_64C19C1FD20CF23');
        $this->addSql('ALTER TABLE item DROP FOREIGN KEY FK_1F1B251EFD20CF23');
        $this->addSql('DROP TABLE category');
        $this->addSql('DROP TABLE form_input');
        $this->addSql('DROP TABLE item');
        $this->addSql('DROP TABLE item_bundle');
    }
}
