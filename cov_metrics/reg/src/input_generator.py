import os
import random
from copy import deepcopy

from src.inst_generator import Word, rvInstGenerator, PREFIX, MAIN, SUFFIX, MUTATE

""" Template versions """
P_M = 0
P_S = 1
P_U = 2

# V_M = 3
# V_S = 3
V_U = 3

templates = [ 'p-m', 'p-s', 'p-u',
              'v-u']
# templates = [ 'p-m', 'p-s', 'p-u' ]

class simInput():
    def __init__(self, prefix: list, words: list, suffix: list, ints: list, data_seed: int, template: int):
        self.prefix = prefix
        self.words = words
        self.suffix = suffix
        self.ints = ints

        self.num_prefix = len(prefix)
        self.num_words = len(words)
        self.num_suffix = len(suffix)

        self.data_seed = data_seed
        self.template = template

    def save(self, name, data=[]):
        prefix_insts = self.get_prefix()
        insts = self.get_insts()
        suffix_insts = self.get_suffix()

        fd = open(name, 'w')
        fd.write('{}\n\n'.format(templates[self.template]))
        fd.write('{}\n\n'.format(self.num_words))

        for inst in prefix_insts[:-1]:
            fd.write('{:<50}\n'.format(inst))

        for (inst, INT) in zip(insts, self.ints):
            fd.write('{:<50}{:04b}\n'.format(inst, INT))

        for inst in suffix_insts[:-1]:
            fd.write('{:<50}\n'.format(inst))

        if data:
            fd.write('data:\n')
            for word in data:
                fd.write('{:016x}\n'.format(word))

        fd.close()

    def save_sic(self, name, cov, data=[]):
        prefix_insts = self.get_prefix()
        insts = self.get_insts()
        suffix_insts = self.get_suffix()

        fd = open(name, 'w')
        fd.write('{}\n\n'.format(cov))
        fd.write('{}\n\n'.format(self.num_words))
        fd.write('{}\n\n'.format(templates[self.template]))

        for inst in prefix_insts[:-1]:
            fd.write('{:<50}\n'.format(inst))

        for (inst, INT) in zip(insts, self.ints):
            fd.write('{:<50}{:04b}\n'.format(inst, INT))

        for inst in suffix_insts[:-1]:
            fd.write('{:<50}\n'.format(inst))

        if data:
            fd.write('data:\n')
            for word in data:
                fd.write('{:016x}\n'.format(word))

        fd.close()

    def get_seed(self):
        return self.data_seed

    def get_template(self):
        return self.template

    def get_prefix(self):
        insts = []
        for word in self.prefix:
            insts += word.get_insts()

        insts.append(PREFIX + '{}:'.format(self.num_prefix))
        return insts

    def get_insts(self):
        insts = []
        for word in self.words:
            insts += word.get_insts()

        insts.append(MAIN + '{}:'.format(self.num_words))
        return insts

    def get_suffix(self):
        insts = []
        for word in self.suffix:
            insts += word.get_insts()

        insts.append(SUFFIX + '{}:'.format(self.num_suffix))
        return insts


class InputGenerator():
    def __init__(self, num_inputs=32, warp_size=32, max_data_seeds=100):
        self.corpus = []

        self.warp_size = warp_size
        self.num_prefix = 3
        self.num_words = 100
        self.num_suffix = 5

        self.num_inputs = num_inputs
        self.counter = 0
        # self.template = random.randint(0, 3)

        self.max_nWords = 200

        self.max_data = max_data_seeds
        self.random_data = {}
        self.data_seeds = []

        self.inst_generator = rvInstGenerator('RV64G')

    def add_data(self, new_data=[]):
        if len(self.data_seeds) == self.max_data:
            seed = self.data_seeds.pop(0)
        else:
            seed = len(self.data_seeds)

        if new_data:
            self.random_data[seed] = new_data
        else:
            self.random_data[seed] = [ random.randint(0, 0xffffffffffffffff) for i in range(64 * 6)] # TODO, Num_data_sections = 6
        self.data_seeds.append(seed)

        return seed

    def update_data_seeds(self, seed):
        assert self.data_seeds.count(seed) == 1, \
            '{} entrie(s) of {} exist in Mutator data_seeds'. \
            format(self.data_seeds.count(seed), seed)

        idx = self.data_seeds.index(seed)
        self.data_seeds.pop(idx)
        self.data_seeds.append(seed)

    def read_label(self, line, tuples):
        label = line[:8].split(':')[0]
        label_num = int(label[2:])

        insts = []
        tuples.append((label_num, insts))

        return tuples

    def set_label(self, label_num, tuples):

        insts = []
        tuples.append((label_num, insts))

        return tuples


    def tuples_to_words(self, tuples, part):
        words = []

        for tup in tuples:
            label = tup[0]
            insts = tup[1]

            word = Word(label, insts)
            word.populate({}, part)

            words.append(word)

        return words

    # def read_ga(self, ga_name):
        # fd = open(ga_name, 'r')
        # lines = fd.readlines()
        # fd.close()

        # ints = []
        # prefix_tuples = []
        # word_tuples = []
        # suffix_tuples = []
        # data = []

        # num_prefix = 0
        # num_words = 0
        # num_suffix = 0

        # part = None
        # tmp_tuples = None
        # num_tmp = 0

        # prefix_label = 0
        # main_label = 0
        # suffix_label = 0


        # template_word = lines.pop(0).split('\n')[0]
        # template = templates.index(template_word)
        # lines.pop(0)
        # while True:
            # try: line = lines.pop(0)
            # except: break

            # if 'data:' in line:
                # part = None
                # while True:
                    # try: word = lines.pop(0)
                    # except: break

                    # data.append(int(word, 16))
                # break
            # elif line[:2] == PREFIX:
                # part = PREFIX
                # tmp_tuples = self.set_label(num_prefix, prefix_tuples)
                # num_prefix += 1
                # num_tmp = num_prefix

                # tmp_tuples[num_tmp - 1][1].append(line[8:50])
            # elif line[:2] == MAIN:
                # part = MAIN
                # tmp_tuples = self.set_label(num_words, word_tuples)
                # num_words += 1
                # num_tmp = num_words
               
                # tmp_tuples[num_tmp - 1][1].append(line[8:50])
            # elif line[:2] == SUFFIX:
                # part = SUFFIX
                # tmp_tuples = self.set_label(num_suffix, suffix_tuples)
                # num_suffix += 1
                # num_tmp = num_suffix

                # tmp_tuples[num_tmp - 1][1].append(line[8:50])
            # # TODO: is this correct?
            # elif line[:2] == MUTATE:
                # if part is PREFIX:
                    # new_word = self.inst_generator.get_word(PREFIX)
                    # self.inst_generator.populate_word(new_word, self.num_prefix, PREFIX)
                # elif part is MAIN:
                    # new_word = self.inst_generator.get_word(MAIN)
                    # self.inst_generator.populate_word(new_word, self.num_words, MAIN)
                # elif part is SUFFIX:
                    # new_word = self.inst_generator.get_word(SUFFIX)
                    # self.inst_generator.populate_word(new_word, self.num_suffix, SUFFIX)
                # else:
                    # new_word = self.inst_generator.get_word(PREFIX)
                    # self.inst_generator.populate_word(new_word, self.num_prefix, PREFIX)
                    # tmp_tuples = prefix_tuples

                # tmp_tuples = self.set_label(num_tmp, tmp_tuples)
                # num_tmp += 1
                # for i in range(len(new_word.get_insts())):
                    # tmp_tuples[num_tmp - 1][1].append(new_word.get_insts()[i][8:50])
            # else:
                # tmp_tuples[num_tmp - 1][1].append(line[8:50])

            # if part == MAIN and line[:2] != MUTATE:
                # ints.append(int(line[-5:-1], 2))

        # prefix = self.tuples_to_words(prefix_tuples, PREFIX)
        # words = self.tuples_to_words(word_tuples, MAIN)
        # suffix = self.tuples_to_words(suffix_tuples, SUFFIX)

        # data_seed = self.add_data(data)
        # sim_input = simInput(prefix, words, suffix, ints, data_seed, template)
        # data = self.random_data[data_seed]

        # assert_intr = False
        # if [ i for i in ints if i != 0 ]:
            # assert_intr = True

        # return (sim_input, data, assert_intr)

    # def read_ga(self, si_name):
        # fd = open(si_name, 'r')
        # lines = fd.readlines()
        # fd.close()

        # ints = []
        # prefix_tuples = []
        # word_tuples = []
        # suffix_tuples = []
        # data = []

        # num_prefix = 0
        # num_word = 0
        # num_suffix = 0

        # part = None
        # tmp_tuples = None
        # num_tmp = None

        # template_word = lines.pop(0).split('\n')[0]
        # template = templates.index(template_word)
        # lines.pop(0)
        # while True:
            # try: line = lines.pop(0)
            # except: break

            # if 'data:' in line:
                # part = None
                # while True:
                    # try: word = lines.pop(0)
                    # except: break

                    # data.append(int(word, 16))
                # break
            # elif line[:2] == PREFIX:
                # part = PREFIX
                # num_prefix += 1
                # tmp_tuples = self.read_label(line, prefix_tuples)
                # num_tmp = num_prefix

                # tmp_tuples[num_tmp - 1][1].append(line[8:50])
            # elif line[:2] == MAIN:
                # part = MAIN
                # num_word += 1
                # tmp_tuples = self.read_label(line, word_tuples)
                # num_tmp = num_word

                # tmp_tuples[num_tmp - 1][1].append(line[8:50])
            # elif line[:2] == SUFFIX:
                # part = SUFFIX
                # num_suffix += 1
                # tmp_tuples = self.read_label(line, suffix_tuples)
                # num_tmp = num_suffix

                # tmp_tuples[num_tmp - 1][1].append(line[8:50])
            # elif line[:2] == MUTATE:

            # else:
                # tmp_tuples[num_tmp - 1][1].append(line[8:50])

            # if part == MAIN and line[:2] != MUTATE:
                # ints.append(int(line[-5:-1], 2))

        # prefix = self.tuples_to_words(prefix_tuples, PREFIX)
        # words = self.tuples_to_words(word_tuples, MAIN)
        # suffix = self.tuples_to_words(suffix_tuples, SUFFIX)

        # data_seed = self.add_data(data)
        # sim_input = simInput(prefix, words, suffix, ints, data_seed, template)
        # data = self.random_data[data_seed]

        # assert_intr = False
        # if [ i for i in ints if i != 0 ]:
            # assert_intr = True

        # return (sim_input, data, assert_intr)

    # currently we ignore prefix and suffix section
    # TODO: add prefix and suffix to gene?
    def read_ga(self, ga_name):
        self.inst_generator.reset()
        fd = open(ga_name, 'r')
        lines = fd.readlines()
        fd.close()

        ints = []
        word_tuples = []
        data = []

        prefix = []
        suffix = []

        num_word = 0
        part = MAIN

        template_word = lines.pop(0).split('\n')[0]
        template = templates.index(template_word)

        total_word = int(lines.pop(0).split('\n')[0])
        lines.pop(0)
        while True:
            try: line = lines.pop(0)
            except: break

            if 'data:' in line:
                part = None
                while True:
                    try: word = lines.pop(0)
                    except: break

                    data.append(int(word, 16))
                break

            if line[:2] == MAIN:
                num_word += 1
                insts = []
                word_tuples.append((num_word - 1, insts))
                # word_tuples = self.read_label(line, word_tuples)
                word_tuples[num_word - 1][1].append(line[8:50])

            elif line[:2] == MUTATE:
                num_word += 1
                insts = []
                word_tuples.append((num_word - 1, insts))
                # word_tuples = self.read_label(line, word_tuples)
               
                new_word = self.inst_generator.get_word(MAIN)
                self.inst_generator.populate_word(new_word, total_word, MAIN)

                insts = new_word.get_insts().copy()

                for i in range(len(insts)):
                    word_tuples[num_word - 1][1].append(insts[i][8:50])
                    if part == MAIN:
                        # MAIN
                        # TODO: MUTATE support interrupt?
                        ints.append(int("0000", 2))
            else:
                word_tuples[num_word - 1][1].append(line[8:50])

            if line[:2] != MUTATE:
                ints.append(int(line[-5:-1], 2))

        words = self.tuples_to_words(word_tuples, MAIN)
        self.reset_labels(words, MAIN)

        for _ in range(self.num_prefix):
            p = self.inst_generator.get_word(PREFIX)
            prefix.append(p)

        for _ in range(self.num_suffix):
            s = self.inst_generator.get_word(SUFFIX)
            suffix.append(s)

        for p in prefix:
            self.inst_generator.populate_word(p, len(prefix), PREFIX)

        for s in suffix:
            self.inst_generator.populate_word(s, len(suffix), SUFFIX)


        data_seed = self.add_data()
        sim_input = simInput(prefix, words, suffix, ints, data_seed, template)
        data = self.random_data[data_seed]

        assert_intr = False
        if [ i for i in ints if i != 0 ]:
            assert_intr = True

        return (sim_input, data, assert_intr)

    

    def make_nop(self, sim_input, nop_mask, part):
        data_seed = sim_input.get_seed()
        prefix = sim_input.prefix
        words = sim_input.words
        suffix = sim_input.suffix
        ints = sim_input.ints
        template = sim_input.template

        if part == PREFIX: target = prefix
        elif part == MAIN: target = words
        else: target = suffix

        assert len(target) == len(nop_mask), \
            'Length of words and nop_mask are not equal'

        new_target = []
        for (word, mask) in zip(target, nop_mask):
            if mask:
                new_word = Word(word.label, ['nop'])
                new_word.populate({}, part)
                new_target.append(new_word)
            else:
                new_target.append(word)

        if part == PREFIX:
            min_input = simInput(new_target, words, suffix, ints, data_seed, template)
        elif part == MAIN:
            new_ints = []
            k = 0
            for i in range(len(nop_mask)):
                if nop_mask[i]:
                    new_ints += [0] * new_target[i].len_insts
                else:
                    new_ints += [ ints[k + j] for j in range(new_target[i].len_insts) ]

                k += new_target[i].len_insts

            min_input = simInput(prefix, new_target, suffix, new_ints, data_seed, template)
        else:
            min_input = simInput(prefix, words, new_target, ints, data_seed, template)

        data = self.random_data[data_seed]
        return (min_input, data)

    def delete_nop(self, sim_input):
        data_seed = sim_input.get_seed()
        prefix = sim_input.prefix
        words = sim_input.words
        suffix = sim_input.suffix
        ints = sim_input.ints
        template = sim_input.template

        words_map = {}
        new_ints = []
        k = 0
        for (part, target) in zip([PREFIX, MAIN, SUFFIX], [prefix, words, suffix]):
            tmps = []
            for word in target:
                if word.insts != ['nop']:
                    new_word = deepcopy(word)
                    tmps.append(new_word)

                if part == MAIN:
                    if word.insts != ['nop']:
                        new_ints += ints[k:k+word.len_insts]
                    k += word.len_insts

            new_target = self.reset_labels(tmps, part)
            words_map[part] = new_target

        del_input = simInput(words_map[PREFIX], words_map[MAIN], words_map[SUFFIX], new_ints, data_seed, template)
        data = self.random_data[data_seed]

        return (del_input, data)

    # def update_corpus(self, corpus_dir, update_num=100):
        # si_files = os.listdir(corpus_dir)

        # num_files = len(si_files)
        # start = max(num_files - update_num, 0)
        # for i in range(start, num_files):
            # try:
                # (sim_input, _) = self.read_siminput(corpus_dir +
                                                    # '/id_{}.si'.format(i))
                # self.add_corpus(sim_input)
            # except:
                # continue

    def reset_labels(self, words, part):
        n = 0

        label_map = {}
        for (n, word) in enumerate(words):
            tup = word.reset_label(n, part)
            if tup:
                label_map[tup[0]] = tup[1]

        max_label = len(words)

        for word in words:
            word.repop_label(label_map, max_label, part)

        return words

    # def mutate_words(self, seed_words, part, max_num):
        # words = []

        # for word in seed_words:
            # rand = random.random()
            # if rand < 0.5:
                # words.append(word)
            # elif rand < 0.75:
                # words.append(word)
                # new_word = self.inst_generator.get_word(part)
                # words.append(new_word)

        # words = words[0:max_num]
        # words = self.reset_labels(words, part)

        # return words

    def get(self, assert_intr=False):
        i_len = 0
        prefix = []
        words = []
        suffix = []

        # prefix1 = []
        # words1 = []
        # suffix1 = []

        # prefix2 = []
        # words2 = []
        # words3 = []
        # words4 = []
        # words4 = []
        # suffix2 = []

        self.inst_generator.reset()

        data_seed = -1
        template = -1

        for n in range(self.num_prefix):
            word = self.inst_generator.get_word(PREFIX)
            prefix.append(word)

        for n in range(self.num_words):
            word = self.inst_generator.get_word(MAIN)
            words.append(word)

        for n in range(self.num_suffix):
            word = self.inst_generator.get_word(SUFFIX)
            suffix.append(word)


        for word in prefix:
            self.inst_generator.populate_word(word, len(prefix), PREFIX)

        max_label = len(words)
        for word in words:
            i_len += word.len_insts
            self.inst_generator.populate_word(word, max_label, MAIN)

        for word in suffix:
            self.inst_generator.populate_word(word, len(suffix), SUFFIX)


        ints = [ 0 for i in range(i_len) ]
        # if assert_intr:
            # idx = random.randint(0, min(len(ints), 10) - 1)
            # INT = random.randint(0x1, 0xf)
            # ints[idx] = INT

        if data_seed == -1:
            data_seed = self.add_data()
        else:
            self.update_data_seeds(data_seed)

        # if self.counter % self.warp_size == 0:
            # self.cur_template = random.randint(0, V_U)
        # self.counter = self.counter + 1

        # template = self.template
        # template = random.randint(0, V_U)
        template = random.randint(0, V_U)

        sim_input = simInput(prefix, words, suffix, ints, data_seed, template)
        data = self.random_data[data_seed]

        return (sim_input, data)


    # def add_corpus(self, sim_input):
        # self.corpus.append(sim_input)

        # self.num_words = min(self.num_words + 1, self.max_nWords)
        # if len(self.corpus) > self.corpus_size:
            # self.corpus.pop(0)
